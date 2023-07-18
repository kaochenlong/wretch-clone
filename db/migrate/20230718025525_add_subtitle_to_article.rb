class AddSubtitleToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :sub_title, :string
  end
end
