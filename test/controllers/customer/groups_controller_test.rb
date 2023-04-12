require "test_helper"

class Customer::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_groups_new_url
    assert_response :success
  end

  test "should get index" do
    get customer_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_groups_show_url
    assert_response :success
  end

  test "should get edit" do
    get customer_groups_edit_url
    assert_response :success
  end
end
