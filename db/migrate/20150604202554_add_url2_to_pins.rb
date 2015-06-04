class AddUrl2ToPins < ActiveRecord::Migration
  def change
    add_column :pins, :url2, :string
  end
end
