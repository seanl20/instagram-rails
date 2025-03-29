class AddPicturePositioningToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :x_offset, :float
    add_column :posts, :y_offset, :float
    add_column :posts, :width, :float
    add_column :posts, :height, :float
  end
end
