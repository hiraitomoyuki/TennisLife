class ApprovalsController < ApplicationController
  def create
    @event_id = params[:approval][:event_id]
    #通知機能　イベントから来たら
    unless params[:approval][:event_id] = nil
      approval = current_user.approvals.new(circle_id: params[:circle_id], event_id: @event_id)
      notification = Notification.new(visitor_id: current_user.id, circle_visited_id: params[:circle_id], event_id: @event_id, action: "approval")
      notification.save
    else
      #サークル詳細画面から来たら
      approval = current_user.approvals.new(circle_id: params[:circle_id])
      approval.create_notification_approval(current_user)
    end
    approval.save
    redirect_to request.referer, notice: "サークルへの参加申請をしました。"
  end

  def destroy
    if params[:approval]
      Approval.find_by(user_id: current_user.id, event_id: params[:approval][:event_id]).destroy
    else
      Approval.find(params[:id]).destroy
    end
    redirect_to request.referer, alert: "サークルへの参加申請を取り消しました。"
  end
end