class AddColumnsToPelegos < ActiveRecord::Migration
  def change
    add_column :pelegos, :provider, :string
    add_column :pelegos, :uid, :string
  end
end
