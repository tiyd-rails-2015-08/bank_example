class AddIndices < ActiveRecord::Migration
  def change
    add_index :clients, :branch_id
    add_index :accounts, :client_id
    add_index :expenses, :account_id
  end
end
