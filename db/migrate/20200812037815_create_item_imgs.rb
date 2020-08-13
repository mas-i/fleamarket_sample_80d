class CreateItemImgs < ActiveRecord::Migration[6.0]
  def change
    create_table :item_imgs do |t|
      t.string :image, null: false
      t.references :item, null: false
      t.timestamps
    end
  end
end
