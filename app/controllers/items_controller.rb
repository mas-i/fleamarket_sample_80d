class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_imgs.new
    @category = Category.where(ancestry: "").limit(13)
  end

  def get_category_children  
    @category_children = Category.find(params[:parent_id]).children 
    end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    end

  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @grandchild = Category.find(@items.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def edit
  end

  def update
  end

  def destory
  end

  

  private

  def item_params
    params.require(:item).permit(
    :name, :explain, :price, :status, 
    :postage, :prefecture,
    :shipping_date, :category_id, 
    item_imgs_attributes: [:image, :_destroy, :id]).merge(:user_id => current_user.id)
  end

  def set_item
    @item = Item.includes(:item_imgs).find(params[:id])
  end
end