class ApprovalsController < ApplicationController
  def create
    @schedule_id = params[:approval][:schedule_id]
    unless params[:approval][:schedule_id] = nil
      approval = current_user.approvals.build(circle_id: params[:circle_id], schedule_id: @schedule_id)
      notification = Notification.new(visitor_id: current_user.id, circle_visited_id: params[:circle_id], schedule_id: @schedule_id, action: "approval")
      notification.save
    else
      approval = current_user.approvals.build(circle_id: params[:circle_id])
      approval.create_notification_approval(current_user)
    end
    approval.save
    redirect_to request.referer, notice: "サークルへの参加申請をしました。"
  end

  def destroy
    if params[:approval]
      Approval.find_by(user_id: current_user.id, schedule_id: params[:approval][:schedule_id]).destroy
    else
      Approval.find(params[:id]).destroy
    end
    redirect_to request.referer, alert: "サークルへの参加申請を取り消しました"
  end
end
