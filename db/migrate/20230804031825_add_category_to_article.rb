class AddCategoryToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :category, :integer
  end
end
