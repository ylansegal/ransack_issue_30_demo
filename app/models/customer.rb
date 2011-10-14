class Customer < Person
  has_many :orders, :as => :customer
end