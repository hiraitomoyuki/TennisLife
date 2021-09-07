class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :bookmarks, :favorites, :entries, :confirm]
  before_action :correct_user, only: [:edit, :destroy]
  
  def show
  end

  def edit
  end

  def update
    if current_user.circle_id.present?
      @circle = Circle.find(current_user.circle_id)
    end
    if @user.update(user_params)
      if params[:user][:circle_id] == nil
        redirect_to user_path(@user), notice: "プロフィールを更新しました。"
      elsif params[:user][:circle_id] != nil
        if @user.circle_id.nil?
          @approval = Notification.new(visitor_id: @user.id, circle_visited_id: params[circle_id], action: "withdrawal")
          @approval.save
          if @circle.user.empty?
            @circle.destroy
          end
          redirect_to user_path(current_user), alert: "サークルを脱退しました。"
        else
          @approval = Approval.find_by(circle_id: params[:user][:circle_id], userid: @user.id, schedule_id: nil)
          @approval.destroy
          @user.create_notification_user(@user)
          redirect_to request.referer, notice: "#{@user.nickname}さんがサークルに参加しました。"
        end
      end
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "退会しました。ご利用ありがとうございました。"
  end

  def bookmarks
  end

  def favorites
    @articles = @user.favorite_articles
  end

  def entries
    @schedules = @user.entry_schedule
  end

  def confirm
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "他の会員の情報編集・削除は禁止です"
    end
  end
  
  def user_params
    params.require(:user).permit(:gender,:nickname,:email,:image,:postal_code,:address,:racket,:good_shot,:introduction,:circle_id)
  end
  
end
