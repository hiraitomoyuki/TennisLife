module NotificationsHelper
  def unchecked_notifications
  	if current_user.circle_id.present?
	    @notifications = current_user.circle.passive_circle_notifications.where(checked: false, action: "circle").
	     				 or(current_user.circle.passive_circle_notifications.where(checked: false, action: "withdrawal")).
	     				 or(current_user.circle.passive_circle_notifications.where(checked: false, action: "article")).
	     				 or(current_user.circle.passive_circle_notifications.where(checked: false, action: "event")).
	     				 or(current_user.passive_notifications.where(checked: false)).
	     				 where.not(visitor_id: current_user.id)
	else
		@notifications = current_user.passive_notifications.where(checked: false)
	end
  end
end
