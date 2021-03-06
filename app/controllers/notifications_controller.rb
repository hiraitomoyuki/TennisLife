class NotificationsController < ApplicationController
  def index
    # サークルの通知一覧
    if params[:circle_id]
      @circle = Circle.find(params[:circle_id])
      @circle_notifications = Notification.where(circle_visited_id: @circle.id).page(params[:page]).per(20)
    else
      # 個人の通知一覧
      @notifications = Notification.where(visited_id: current_user.id).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "circle")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "withdrawal")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "article")).
                       or(Notification.where(circle_visited_id: current_user.circle_id, action: "event")).
                       where.not(visitor_id: current_user.id).page(params[:page]).per(20)
                       
      # 未チェックのものをチェック済に更新する  
      @notifications.where(checked: false).each do |notification|
        notification.update(checked: true)
    	end
      
    end
  end
end
