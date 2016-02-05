class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post =Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def create
    @post = Post.new(params_post)
    if @post.save
        flash[:notice] = "Success Add Records"
        redirect_to action: 'index'
    else
        flash[:error] = "data not valid"
        render 'new'
    end
  end

  def update
     @post = Post.find_by_id(params[:id])
     if @post.update(params_post)
        flash[:notice] = "Success Update Records"
        redirect_to action: 'index'
     else
        flash[:error] = "data not valid"
        render 'edit'
     end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.destroy
        flash[:notice] = "Success Delete a Records"
        redirect_to action: 'index'
    else
        flash[:error] = "fails delete a records"
        redirect_to action: 'index'
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def params_post
      params.require(:post).permit(:title, :image)
    end
end
