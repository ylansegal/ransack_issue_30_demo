class CreatePeople < ActiveRecord::Migration
  def change
    create_table "people", :force => true do |t|
      t.string   "email"
      t.string   "type"
    end
  end
end
