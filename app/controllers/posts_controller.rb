class PostsController < ApplicationController
  respond_to :json

  def index
    posts = Post.all

    respond_with(posts) do |format|
      format.json { render :json => posts.as_json }
    end
  end

  def create
    new_post = Post.new
    new_post.title = params[:new_post][:title][0...250]
    new_post.contents = params[:new_post][:contents]

    if new_post.valid?
      new_post.save!
    else
      render "public/422", :status => 422
      return
    end

    respond_with(new_post) do |format|
      format.json { render :json => new_post.as_json }
    end
  end

  def update
    edit_post = Post.find_by_id(params[:edit_post][:id])
    edit_post.title = params[:edit_post][:title][0...250]
    edit_post.contents = params[:edit_post][:contents]

    if edit_post.valid?
      edit_post.save!
    else
      render "public/422", :status => 422
      return
    end

    respond_with(edit_post) do |format|
      format.json { render :json => edit_post.as_json }
    end
  end

end
