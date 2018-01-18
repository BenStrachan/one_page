class PostsController < ApplicationController
  layout 'sub_page'
  before_action :set_post, only: [:show]

  def show
    @setting = HomeSetting.first
  end

  private
  def set_post
    @post = Blog.find params[:id]
  end
end
