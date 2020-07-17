class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    # binding.pry
    @post = Post.find(params[:id])
    # binding.pry
    # @post.update(post_params)
    if params[:comment]
      @comment = Comment.create(params.require(:comment).permit(:user_id, :content))
      @post.comments << @comment
      # @post.comments.build(content: params[:comment][:content])
      # binding.pry
    end
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
