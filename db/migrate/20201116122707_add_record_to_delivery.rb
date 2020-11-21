class AddRecordToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_reference  :deliveries,  :record, foreign_key: true
  end
end
