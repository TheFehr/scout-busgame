# frozen_string_literal: true

require 'test_helper'

class PermitBuysControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get permit_buys_create_url
    assert_response :success
  end
end
