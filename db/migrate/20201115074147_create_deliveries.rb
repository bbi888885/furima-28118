class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :city,           default: "",  null: false 
      t.string :banchi,         default: "",  null: false
      t.string :building_name,  default: ""
      t.string :tel,                          null: false
      t.timestamps
    end
  end
end
