module NotificationsHelper
  def unchecked_notifications
    #現在のユーザーがサークルに所属しているか判定
    if current_user.circle_id.present?
      notices = current_user.circle.passive_circle_notifications
      unchecked_notices = []
      notices.each do |n|
        #未チェック、もしくは自身の投稿でなければ
        unless n.checked? || (n.visitor_id == current_user.id)
          #whenのアクションのものから探してnに格納
          case n.action
          when "circle", "withdrawal", "article", "event"
            unchecked_notices << n
          end
        end
      end
      
      @notifications = unchecked_notices
    #サークルに所属していなければ
    else
      @notifications = current_user.passive_notifications.where(checked: false)
    end
  end
end