class CreateToolbox < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'

    create_table :toolboxes, id: :uuid do |t|
      t.string :name,     null: false, default: ""
      t.string :location, null: false
      t.string :owner
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :toolboxes
  end
end
