class CreateRezepts < ActiveRecord::Migration
  def change
    drop_table :rezepts
    create_table :rezepts do |t|
      t.string :title
      t.text :zutaten
      t.text :zubereitung

      t.timestamps
    end
  end
end
