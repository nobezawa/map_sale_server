class ShopCategoriesController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shop_categories = ShopCategory.all
  end

  def show
  end

  # GET /shops/new
  def new
    @shop_category = ShopCategory.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop_category = ShopCategory.new(shop_params)

    respond_to do |format|
      if @shop_category.save
        format.html { redirect_to @shop_category, notice: 'ShopCategory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @shop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop_category.update(shop_params)
        format.html { redirect_to @shop_category, notice: 'ShopCategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop_category.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop_category = ShopCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop_category).permit(:type_name)
    end
end
