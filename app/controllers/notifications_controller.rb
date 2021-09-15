class NotificationsController < ApplicationController
  def index
    if params[:circle_id]
      @circle = Circle.find(params[:circle_id])
      @circle_notifications = Notification.where(circle_visited_id: @circle.id).page(params[:page]).per(10)
    else
      @notifications = Notification.where(visited_id: current_user.id).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "circle")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "withdrawal")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "article")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "event")).
                       where.not(visitor_id: current_user.id).page(params[:page]).per(10)
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
    end
  end
end
