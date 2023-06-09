require "test_helper"

class Customer::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_posts_new_url
    assert_response :success
  end

  test "should get index" do
    get customer_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_posts_show_url
    assert_response :success
  end
end
