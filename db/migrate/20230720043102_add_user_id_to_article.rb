class AddUserIdToArticle < ActiveRecord::Migration[7.0]
  def change
    # add_column :articles, :user_id, :integer
    # add_index :articles, :user_id

    # add_reference
    add_belongs_to :articles, :user, index: true
  end
end
