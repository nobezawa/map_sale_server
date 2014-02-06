class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :event_new]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  def show
    @shop_category = ShopCategory.find_by('id' => @shop.shop_category_id)
    @district = District.find_by('id' => @shop.district_id)
    @events =@shop.events
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    @company = Company.all
    @shop_category = ShopCategory.all

  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shop }
      else
        format.html { render action: 'new' }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  def event_new
    @event = Event.new
  end

  def event_create
    @event = Event.new(event_params)
    @event.save!
    redirect_to shops_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:company_id, :shop_category_id, :prefecture, :name, :district, :address)
    end

    def event_params
      params.require(:event).permit(:shop_id, :title, :summary, :dicount_conde, :start_time, :end_time)
    end
    
end
