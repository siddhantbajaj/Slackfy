class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end

  def set_webhook
    shop_domain = ShopifyAPI::Shop.current.domain
    shop = Shop.find_by(shopify_domain: shop_domain)
    shop.webhook_url = params[:webhook_url]
    shop.save
    redirect_to url_for(:controller => "home", action: "main")
  end

  def main
  end
end
