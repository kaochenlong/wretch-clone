class CreateLikeLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :like_logs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true
    end
  end
end
