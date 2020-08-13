class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :name, null:false, index: true
      t.integer :price, null: false
      t.text :explain, null: false
      t.string :status, null: false
      t.integer :postage, null: false
      t.string :prefecture, null: false
      t.string :shipping_date, null: false
      t.string :sale_status, null: false, default: true
      t.timestamps
    end
  end
end
