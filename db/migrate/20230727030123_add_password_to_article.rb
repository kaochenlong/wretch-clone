class AddPasswordToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :password, :string
  end
end
