class SchedulesController < ApplicationController
  def index
    @circle = Circle.find_by(id: params[:circle_id])
    @schedules = Schedule.where(circle_id: params[:circle_id])
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @circle = Circle.find_by(id: params[:circle_id])
    @schedule = Schedule.new
  end

  def create
    @circle = Circle.find_by(id: params[:circle_id])
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      @schedule.create_notification_schedule(current_user)
      redirect_to schedules_path(circle_id: params[:schedule][:circle_id]), notice: "予定を作成しました。"
    else
      render :error
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path(circle_id: @schedule.circle_id), notice: "予定を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @circle = Circle.find_by(id: params[:circle_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      redirect_to schedules_path(circle_id: @schedule.circle_id), alert: "予定を削除しました。"
    end
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:title, :description, :start_date, :end_date, :circle_id)
  end
end
