require "test_helper"

class Customer::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_chats_index_url
    assert_response :success
  end
end
