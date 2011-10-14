class Order < ActiveRecord::Base
  belongs_to :customer, :polymorphic => true
end
