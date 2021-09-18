module NotificationsHelper
  def unchecked_notifications
  	if current_user.circle_id.present?
  	  notices = current_user.circle.passive_circle_notifications
  	  unchecked_notices = []
  	  notices.each do |n|
  	   # byebug
  	    unless n.checked? || (n.visitor_id == current_user.id)
    	    case n.action
  	      when "circle", "withdrawal", "article", "event"
  	        unchecked_notices << n
    	    end
    	  end
    	end

	    @notifications = unchecked_notices
  	else
  	　@notifications = current_user.passive_notifications.where(checked: false)
  	end
  end
end
