class ItemsController < ApplicationController
  # before_action :move_to_index, only: [:show]
  before_action :set_item, only: [:show, :edit, :update]

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
    # @comment = Comment.new 準備のみ
    # @comments = @item.comments.includes(:user) 準備のみ
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def edit
  end

  def update

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end

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

  # def move_to_index
  #   redirect_to root_path unless user_signed_in?
  # end
end
