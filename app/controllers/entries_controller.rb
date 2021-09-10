class EntriesController < ApplicationController
  def create
    entry = current_user.entries.build(schedule_id: params[:schedule_id])
    entry.save
    if params[:circle_id].present?
      approval = Approval.find_by(circle_id: params[:circle_id], user_id: params[:user_id], schedule_id: params[:schedule_id])
      approval.destroy
    end
    entry.create_notification_entry(current_user)
    redirect_to request.referer, notice: "予定に参加しました。"
  end

  def destroy
    entry = current_user.entries.find_by(schedule_id: params[:schedule_id])
    entry.destroy
    redirect_to request.referer, alert: "予定への参加をキャンセルしました。"
  end
end
