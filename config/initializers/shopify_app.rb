ShopifyApp.configure do |config|
  config.api_key = "6715d9aaa6b429fb973e5c095077cf47"
  config.secret = "f61d0d591a324297853176a3402c5599"
  config.scope = "read_orders, read_products, write_products"
  config.embedded_app = true
  config.webhooks = [
      {topic: 'products/create', address: 'https://4fef6db1.ngrok.io/webhooks/products_create', format: 'json'}
  ]
end
