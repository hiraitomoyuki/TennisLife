class RelationshipsController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    current_user.circle.follow(params[:circle_id])
    @circle.create_notification_follow(current_user)
    redirect_to request.referer, notice: "フォローしました。"
  end

  def destroy
    current_user.circle.unfollow(params[:circle_id])
    redirect_to request.referer, alert: "フォローを解除しました。"
  end

  def matching
    @circle = Circle.find_by(id: params[:circle_id])
    @circles = @circle.matchers
  end
end
