class AddUrl4ToPins < ActiveRecord::Migration
  def change
    add_column :pins, :url4, :string
  end
end
