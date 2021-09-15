class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :map, :calendar, :member, :matching, :approvals]
  
  def index
    @q = Circle.ransack(params[:q])
    @circles = @q.result(distinct: true)
    @pref = params[:prefecture_code]
    @prefecture = JpPrefecture::Prefecture.find(@pref)
    @prefecture_circles = Circle.where(prefecture_code: @pref)
    if params[:q]
      @search_prefecture = JpPrefecture::Prefecture.find(params[:q][:prefecture_code_eq].to_i)
    end
  end

  def show
    @user = current_user
    unless @user.circle_id.nil?
      @current_circle = Circle.find(@user.circle_id)
    end
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @user = current_user
    if @circle.save
      @user.update(circle_id: @circle.id)
      redirect_to circles_path, notice: "#{@circle.name}を立ち上げました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @circle.update(circle_params)
      redirect_to circle_path(@circle), notice: "サークルの情報を更新しました。"
    else
      render :edit
    end
  end

  def calendar
    @events = @circle.events
  end

  def map
  end

  def member
  end

  def approvals
    @approvals = Approval.where(circle_id: @circle.id)
    @event_approvals = Approval.where(circle_id: @circle.id, action: "entry")
  end
  
  private
  
  def set_circle
    @circle = Circle.find(params[:id])
  end
  
  def search_params
    params.require(:q).permit(:name_cont, :address_cont, :prefecture_code_eq, :number_of_people_gteq)
  end
  
  def circle_params
    params.require(:circle).permit(:name, :image, :theme, :postal_code, :prefecture_code, :address, :practice_day, :number_of_people, :entry_fee, :members_wanted, :crrently_recruiting_player, :introduction, :facebook, :instagram, :twitter, :homepage_url, :email)
  end
end
