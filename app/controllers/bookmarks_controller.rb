class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(circle_id: params[:circle_id])
    bookmark.save
    redirect_to request.referer, notice: "サークルをブックマークしました。"
  end

  def destroy
    current_user.bookmarks.find_by(circle_id: params[:circle_id]).destroy
    redirect_to request.referer, alert: "サークルのブックマークを外しました"
  end
end