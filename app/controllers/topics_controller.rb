class TopicsController < ApplicationController
  before_action :set_side_bar_topics
  layout "blog"

  def index
    @topics = Topic.all
  end

  def create 
  end 

  def show
    @topic = Topic.find(params[:id])
    logged_in?(:site_admin) ? @blogs = @topic.blogs.desc_blogs.page(params[:page]).per(5)  : @blogs = @topic.blogs.published.desc_blogs.page(params[:page]).per(5)
  end

  private 

  def set_side_bar_topics 
    @sidebar_topics = Topic.with_blogs
  end 


end
