class CreateKitchenItems < ActiveRecord::Migration[5.1]
  def change
    create_table :kitchen_items do |t|
      t.string :name
      t.float :purchased_quantity, default: 0
      t.float :used_quantity, default: 0
      t.string :unit
      t.belongs_to :receipt_item, foreign_key: true

      t.timestamps
    end
  end
end
