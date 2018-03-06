require 'test_helper'

class TicketTechnologiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ticket_technologies_create_url
    assert_response :success
  end

end
