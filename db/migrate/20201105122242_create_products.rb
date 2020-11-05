class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string             :item,              null: false
      t.text               :description,       null: false
      t.category_id        :integer,           null: false
      t.status_id          :integer,           null: false
      t.price              :integer,           null: false
      t.delivery_cost_id   :integer,           null: false
      t.shipping_area_id   :integer,           null: false
      t.how_many_days_id   :integer,           null: false
      t.user               :references,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
