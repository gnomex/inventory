class CreateComponents < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :components, id: :uuid do |t|
      t.string  :name,          null: false
      t.integer :stock,         null: false, default: 0
      t.text    :description,   null: false, default: ""
      t.string  :model,         null: false, default: ""
      t.string  :manufacturer
      t.string  :datasheet,     null: false, default: ""
      t.string  :image_link

      t.jsonb  :status, null: false, default: '{}'
      t.timestamps
    end

    add_column :components, :category_id, :uuid, index: true
    add_column :components, :toolbox_id, :uuid, index: true
    add_index :components, :name, unique: true
    add_index :components, :status, using: :gin
  end

  def down
    drop_table :components
  end
end
