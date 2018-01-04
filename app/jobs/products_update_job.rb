class ProductsUpdateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    if shop.webhook_url.present?
      shop.with_shopify_session do
        title = webhook[:title]
        id = webhook[:id]


        # ShopifyAPI::Product.new({
        #     id: id,
        #     title: 'my_own_title'
        #                         }).save

        notifier = Slack::Notifier.new shop.webhook_url
        notifier.ping "Hello World"



        # url = URI(shop.webhook_url)
        #
        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        #
        # request = Net::HTTP::Post.new(url)
        # request["content-type"] = 'application/json'
        # request.body = {message: 'keep going!'}.to_json
        #
        # response = http.request(request)

      end
    end
  end
end