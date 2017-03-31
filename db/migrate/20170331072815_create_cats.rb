class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age
      t.integer :owner_id
      t.timestamps
    end
  end
end
