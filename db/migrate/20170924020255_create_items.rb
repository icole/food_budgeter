class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.float :quantity
      t.string :unit
      t.float :price
      t.references :product, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
