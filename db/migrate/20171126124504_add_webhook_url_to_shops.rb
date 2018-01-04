class AddWebhookUrlToShops < ActiveRecord::Migration
  def change
    add_column :shops, :webhook_url, :string
  end
end
