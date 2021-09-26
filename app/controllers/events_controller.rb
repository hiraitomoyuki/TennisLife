class EventsController < ApplicationController
  def index
    @circle = Circle.find_by(id: params[:circle_id])
    @events = Event.where(circle_id: params[:circle_id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @circle = Circle.find_by(id: params[:circle_id])
    @event = Event.new
  end

  def create
    @circle = Circle.find_by(id: params[:circle_id])
    @event = Event.new(event_params)
    if @event.save
      @event.create_notification_event(current_user)
      redirect_to events_path(circle_id: params[:event][:circle_id]), notice: "予定を作成しました。"
    else
      redirect_to events_path(circle_id: params[:event][:circle_id]), alert: "予定の作成に失敗しました。"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path(circle_id: @event.circle_id), notice: "予定を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @team = Circle.find_by(id: params[:circle_id])
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path(circle_id: @event.circle_id), alert: "予定を削除しました。"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :circle_id)
  end
end