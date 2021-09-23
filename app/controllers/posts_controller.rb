class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to topic_path(params[:post]['topic_id'])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to topics_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:topic_id, :name, :body)
  end
end
