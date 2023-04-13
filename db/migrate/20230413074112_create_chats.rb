class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.text :message
      t.integer :group_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
