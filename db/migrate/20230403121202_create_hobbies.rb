class CreateHobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :hobbies do |t|
      t.string :name,null: false
      t.integer :customer_id
      t.timestamps
    end
  end
end
