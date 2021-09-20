class ArticlesController < ApplicationController
  def index
    #サークル詳細画面から遷移
    if params[:circle_id]
      @circle = Circle.find_by(id: params[:circle_id])
      @articles = Article.where(circle_id: params[:circle_id]).order(created_at: :desc)
    #タグ検索の場合
    elsif params[:tag_name]
      @tag = params[:tag_name]
      @articles = Article.tagged_with("#{params[:tag_name]}").order(created_at: :desc)
    #ヘッダーから遷移
    else
      @articles = Article.all.order(created_at: :desc)
    end
    
    #ランキング機能
    @tags =ActsAsTaggableOn::Tag.most_used(5)
    @num = (1...6)
    @favorite_ranks = Article.find(Favorite.group(:id).order("count(article_id) desc").limit(5).pluck(:article_id))
    @comment_ranks = Article.find(Comment.group(:id).order("count(article_id) desc").limit(5).pluck(:article_id))
    @post_ranks = Circle.find(Article.group(:id).order("count(circle_id) desc").limit(5).pluck(:circle_id))
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
    gon.available_tags = Article.tags_on(:tags).pluck(:name)
  end

  def create
    @circle = current_user.circle
    @article = Article.new(article_params)
    @article.circle_id = @circle.id
    if @article.save
      @article.create_notification_article(current_user)
      redirect_to article_path(@article), notice: "サークル活動記録を投稿しました。"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    gon.article_tags = @article.tag_list
    gon.available_tags = Article.tags_on(:tags).pluck(:name)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "サークル活動記録を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path, alert: "サークル活動記録を削除しました。"
    else
      render :edit
    end
  end

    private

  def article_params
    params.require(:article).permit(:title, :body, :image, :tag_list)
  end


end