json.array!(@products) do |product|
  json.extract! product, :id, :title, :sku, :color, :collection, :warehouse_inventory, :bdbox_inventory, :blacklion_inventory, :cotswold_inventory, :cost_cents, :notes, :wholesale_cents, :retail_cents, :selling
  json.url product_url(product, format: :json)
end
