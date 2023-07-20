class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(details)
    @id = details[:id]
    @name = details[:attributes][:name]
    @description = details[:attributes][:description]
    @unit_price = details[:attributes][:unit_price]
    @merchant_id = details[:attributes][:merchant_id]
  end
end