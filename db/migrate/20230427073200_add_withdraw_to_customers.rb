class AddWithdrawToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_withdraw, :boolean,default: false
  end
end
