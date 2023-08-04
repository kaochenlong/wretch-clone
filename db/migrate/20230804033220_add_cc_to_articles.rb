class AddCcToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :cc, :integer
  end
end
