require 'test_helper'
puts "loading session test"

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should allow creating a new session" do
    user = users(:normal)
    post :create, { :session => { :email => user.email, :password => "foo" }}
    assert_equal 302, response.status
    assert_equal user_url(user), response.location
    assert_equal session["user_id"], user.id
    assert_nil session["flash"]
  end

  test "should not create a new session for the wrong password" do
    user = users(:normal)
    post :create, { :session => { :email => user.email, :password => "bar" }}
    assert_equal 200, response.status
    assert_nil session["user_id"]
    assert_equal "Invalid email/password combination", session["flash"]["flashes"]["danger"]
  end


end
