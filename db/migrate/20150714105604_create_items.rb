class CreateItems < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :items, id: :uuid do |t|
      t.string  :name,      null: false, default: ""
      t.integer :quantity,  null: false
      t.string  :useful_for

      t.timestamps
    end

    add_column :items, :category_id, :uuid, index: true
    add_column :items, :toolbox_id , :uuid, index: true
    add_index :items, :name, unique: true
  end

  def down
    drop_table :items
  end
end
