class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    favorite.create_notification_favorite(current_user)
    redirect_to request.referer, notice: "いいねしました。"
  end

  def destroy
    current_user.favorites.find_by(article_id: params[:article_id]).destroy
    redirect_to request.referer, alert: "いいねを外しました。"
  end
end
