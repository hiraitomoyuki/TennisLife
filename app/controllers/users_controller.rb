class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :bookmarks, :favorites, :entries, :confirm]
  before_action :correct_user, only: [:edit, :destroy]
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "退会しました。ご利用ありがとうございました"
  end

  def bookmarks
  end

  def favorites
  end

  def entries
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
