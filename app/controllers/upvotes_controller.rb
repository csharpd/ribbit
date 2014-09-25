class UpvotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.upvotes.create
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:post_id]).upvotes.last
redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.upvotes.last.destroy
    redirect_to '/posts'
  end

end
