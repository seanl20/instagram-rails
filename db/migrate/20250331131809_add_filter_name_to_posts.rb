class AddFilterNameToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :filter_name, :string
  end
end
