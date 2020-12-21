class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item,          null: false
      t.references :user,    foreign_key: true
      t.integer    :price,         null: false
      t.text       :detail,        null: false
      t.integer    :category_id,   null: false
      t.integer    :condition_id,  null: false
      t.integer    :shipping_id,   null: false
      t.integer    :prefecture_id, null: false
      t.integer    :day_id,        null: false
      t.timestamps
    end
  end
end
