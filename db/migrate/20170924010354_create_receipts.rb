class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :store
      t.float :base_amount
      t.float :tax_amount
      t.float :total_amount
      t.datetime :purchased_on

      t.timestamps
    end
  end
end
