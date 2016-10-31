class PinsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # GET /pins
  def index
    @pins = Pin.all
  end

  # GET /pins/1
  def show
    @pin = Pin.find(params[:id])
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.new
  end

  # GET /pins/1/edit
  def edit
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  def create
    @pin = current_user.pins.new(pin_params)
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /pins/1
  def update
    @pin = current_user.pins.find(params[:id])
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /pins/1
  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
      redirect_to pins_url, notice: 'Pin was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
