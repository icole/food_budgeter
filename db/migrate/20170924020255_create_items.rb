class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :sku
      t.string :name
      t.float :quantity
      t.string :unit
      t.float :price
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
