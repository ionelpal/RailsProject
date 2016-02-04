class OrderitemsController < ApplicationController
before_filter :authenticate_user!
before_filter :ensure_admin, :only => [:new, :create, :edit, :destroy]
before_action :set_item, only: [:show, :edit, :update,:destroy]
  def ensure_admin
  unless current_user && current_user.admin?
  render:text => "Access Error", :status => :unauthorized
  end
  end 
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
