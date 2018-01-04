class ProductsCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    if shop.webhook_url.present?
      shop.with_shopify_session do
        title = webhook[:title]
        id = webhook[:id]
        notifier = Slack::Notifier.new shop.webhook_url
        notifier.ping "New Product Created - " + title
      end
    end
  end
end