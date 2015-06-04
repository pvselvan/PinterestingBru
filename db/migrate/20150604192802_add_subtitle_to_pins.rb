class AddSubtitleToPins < ActiveRecord::Migration
  def change
    add_column :pins, :subtitle, :string
  end
end
