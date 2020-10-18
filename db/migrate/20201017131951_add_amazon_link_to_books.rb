class AddAmazonLinkToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :amazon_link, :text
  end
end
