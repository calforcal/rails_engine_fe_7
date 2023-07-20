class MerchantsController < ApplicationController
  def index
    @merchants = EngineFacade.new.merchants
  end

  def show
    @merchant = EngineFacade.new(params[:id]).merchant
    @items = EngineFacade.new(params[:id]).merchants_items
  end
end
