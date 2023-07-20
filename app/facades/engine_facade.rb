class EngineFacade
  def initialize(param_1=nil, param_2=nil)
    @param_1 = param_1
    @param_2 = param_2
  end

  def merchants
    service = EngineService.new

    json = service.merchants_index

    @merchants = json[:data].map { |details| Merchant.new(details) }
  end

  def merchant
    service = EngineService.new

    json = service.merchants_show(@param_1)

    @merchant = Merchant.new(json[:data])
  end

  def merchants_items
    service = EngineService.new

    json = service.merchants_items_index(@param_1)

    @items = json[:data].map { |details| Item.new(details) }
  end

  def item
    service = EngineService.new

    json = service.merchants_items_show(@param_1, @param_2)

    @item = Item.new(json[:data])
  end
end