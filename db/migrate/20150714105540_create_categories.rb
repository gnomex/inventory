class CreateCategories < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :categories, id: :uuid do |t|
      t.string  :name, null: false, default: ""

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end

  def down
    drop_table :categories
  end
end
