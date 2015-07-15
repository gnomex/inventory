class CreateItems < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :items, id: :uuid do |t|
      t.string  :name,      null: false, default: ""
      t.integer :quantity,  null: false
      t.string  :useful_for

      t.belongs_to :category, index: true
      t.belongs_to :toolbox,  index: true

      t.timestamps
    end

    add_index :items, :name, unique: true
  end

  def down
    drop_table :items
  end
end
