class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    # El carro de la sesión actual
    @cart = current_cart
    # El producto obtenido por su id
    product = Product.find(params[:product_id])
    # @cart_item = CartItem.new(cart_item_params)
    # @cart_item = @cart.cart_items.build(product: product)
    @cart_item = @cart.add_product(params[:product_id], params[:product_quantity].to_i)

    respond_to do |format|
      if @cart_item.save
        # format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        # format.html { redirect_to @cart_item.cart, notice: 'El producto se ha añadido al carro' }
        format.html { redirect_to store_url }
        format.js { @last_item = @cart_item }
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :cart_id)
    end
end
