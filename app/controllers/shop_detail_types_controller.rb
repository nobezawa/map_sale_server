class ShopDetailTypesController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shop_detail_types = ShopDetailType.all
    @shop_category = ShopCategory.all
    @hash = @shop_category.map{ |i| [i.id, i.type_name]}.flatten

  end

  def show
  end

  # GET /shops/new
  def new
    @shop_detail_type = ShopDetailType.new
    @shop_category = ShopCategory.all
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop_detail_type = ShopDetailType.new(shop_detail_params)

    respond_to do |format|
      if @shop_detail_type.save
        format.html { redirect_to @shop_detail_type, notice: 'ShopDetailType was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop_detail_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @shop_detail_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop_detail_type.update(shop_detail_params)
        format.html { redirect_to @shop_detail_type, notice: 'ShopDetailType was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shop_detail_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop_detail_type.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop_detail_type = ShopDetailType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_detail_params
      params.require(:shop_detail_type).permit(:shop_category_id, :detail_tag_name)
    end
end
