class WhiteController < ApplicationController
 
before_filter :authenticate_user!
before_filter :ensure_admin, :only => [:new, :create, :edit, :destroy]
before_action :set_item, only: [:show, :edit, :update,:destroy]
  def ensure_admin
  unless current_user && current_user.admin?
  render:text => "Access Error", :status => :unauthorized
  end
  end 

  def index
     @items = Item.where(category: 'White')
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :image_ur, :img_url_big, :category)
    end
end
