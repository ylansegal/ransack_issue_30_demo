class CreateOrders < ActiveRecord::Migration
  def change
    create_table "orders", :force => true do |t|
      t.integer  "customer_id"
      t.string   "customer_type"
    end
    
  end
end
