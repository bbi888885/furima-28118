class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string       :item,              null: false
      t.text         :description,       null: false
      t.integer      :category_id,       null: false
      t.integer      :status_id,         null: false
      t.integer      :price,             null: false
      t.integer      :delivery_cost_id,  null: false
      t.integer      :shipping_area_id,  null: false
      t.integer      :how_many_day_id,  null: false
      t.references   :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
