class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :payee
      t.integer :account_id
      t.date :spent_on

      t.timestamps null: false
    end
  end
end
