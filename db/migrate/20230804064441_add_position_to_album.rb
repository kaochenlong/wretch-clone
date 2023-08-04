class AddPositionToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :position, :integer
  end
end
