class AddTermsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :terms_of_service, :boolean
  end
end
