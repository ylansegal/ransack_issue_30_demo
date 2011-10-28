require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  
  def setup
    abe = Customer.create :email => 'abe@email.com'
    bob = Customer.create :email => 'bob@email.com'
    Order.create! :customer => abe
    Order.create! :customer => bob
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_equal 2, Order.count
  end
  
  test 'index_without_dot' do
    get :index, {:q => {:customer_of_Person_type_email_cont => 'email'}}
    assert_response :success
    assert assigns(:orders)
    @orders = assigns(:orders)
    assert_equal 2, @orders.count, "#{@orders.inspect}"
  end
  
  test 'index_with_dot' do
    get :index, {:q => {:customer_of_Person_type_email_cont => 'email.com'}}
    assert_response :success
    assert assigns(:orders)
    @orders = assigns(:orders)
    assert_equal 2, @orders.count, "#{@orders.inspect}"
  end
  
  test 'index_with_dot_and_includes' do
    get :index_with_includes, {:q => {:customer_of_Person_type_email_cont => 'email.com'}}
    assert_response :success
    assert assigns(:orders)
    @orders = assigns(:orders)
    assert_equal 2, @orders.count, "#{@orders.inspect}"
  end
end
