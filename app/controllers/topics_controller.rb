class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @newTopic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end
  
   private
  
  def topic_params
    params.require(:topic).permit(:user_id, :title)
  end
end
