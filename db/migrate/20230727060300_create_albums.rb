class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.string :password
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :deleted_at
      t.boolean :online, default: true

      t.timestamps
    end

    add_index :albums, :deleted_at
  end
end
