class AddUrl3ToPins < ActiveRecord::Migration
  def change
    add_column :pins, :url3, :string
  end
end
