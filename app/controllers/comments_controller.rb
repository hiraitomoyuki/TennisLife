class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      @comment.create_notification_comment(current_user, @comment.id)
      redirect_to request.referer, notice: "コメントを投稿しました"
    else
      render :error
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], article_id: params[:article_id])
    if comment.destroy
      redirect_to request.referer, alert: "コメントを削除しました"
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
