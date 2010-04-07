class PostsController < ApplicationController
  before_filter :require_admin, :except=>[:index, :show, :rss]
  
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page=>params[:page], :per_page=>10)
    else
      @posts = Post.paginate(:page=>params[:page], :per_page=>10)
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path
    else
      render :action=>"new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :action=>"edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  
  def rss
    @posts = Post.all(:limit=>10)
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
     
  private
    def require_admin
      unless is_admin?
        render :text=>"Access denied", :status=>403
        return false
      end
    end
end
