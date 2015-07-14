class CreateComponents < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :components, id: :uuid do |t|
      t.integer :part_number,   null: false, index: true, unique: true
      t.integer :stock,         null: false
      t.string  :description,   null: false, default: ""
      t.string  :manufacturer
      t.string  :datasheet,     null: false, default: ""
      t.string  :image_link

      t.belongs_to :category, index: true

      t.jsonb  :status, null: false, default: '{}'
      t.timestamps
    end

    add_index :components, :status, using: :gin
  end

  def down
    drop_table :components
  end
end
