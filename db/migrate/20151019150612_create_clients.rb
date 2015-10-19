class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :branch_id
      t.string :hometown

      t.timestamps null: false
    end
  end
end
