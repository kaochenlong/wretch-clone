class Fdlfjdfds < ActiveRecord::Migration[7.0]
  def up
    Album.order(:updated_at).each.with_index(1) do |album, idx|
      album.update_column :position, idx
    end
  end
end
