class EngineService
  def merchants_index
    get_url('/api/v1/merchants')
  end

  def merchants_show(id)
    get_url("api/v1/merchants/#{id}")
  end

  def merchants_items_index(id)
    get_url("api/v1/merchants/#{id}/items")
  end

  def merchants_items_show(merchant_id, item_id)
    get_url("api/v1/merchants/#{merchant_id}/item/#{item_id}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://127.0.0.1:3000')
  end
end