class CreateReceiptItems < ActiveRecord::Migration[5.1]
  def change
    create_table :receipt_items do |t|
      t.string :sku
      t.string :brand
      t.string :name
      t.float :quantity
      t.string :unit
      t.float :price
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
