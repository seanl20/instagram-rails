class AddDescriptionToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :description, :text
  end
end
