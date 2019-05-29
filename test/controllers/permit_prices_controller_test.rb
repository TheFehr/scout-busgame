# frozen_string_literal: true

require 'test_helper'

class PermitPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permit_price = permit_prices(:one)
  end

  test 'should get index' do
    get permit_prices_url
    assert_response :success
  end

  test 'should get new' do
    get new_permit_price_url
    assert_response :success
  end

  test 'should create permit_price' do
    assert_difference('PermitPrice.count') do
      post permit_prices_url, params: { permit_price: { permit_id: @permit_price.permit_id, price: @permit_price.price } }
    end

    assert_redirected_to permit_price_url(PermitPrice.last)
  end

  test 'should show permit_price' do
    get permit_price_url(@permit_price)
    assert_response :success
  end

  test 'should get edit' do
    get edit_permit_price_url(@permit_price)
    assert_response :success
  end

  test 'should update permit_price' do
    patch permit_price_url(@permit_price), params: { permit_price: { permit_id: @permit_price.permit_id, price: @permit_price.price } }
    assert_redirected_to permit_price_url(@permit_price)
  end

  test 'should destroy permit_price' do
    assert_difference('PermitPrice.count', -1) do
      delete permit_price_url(@permit_price)
    end

    assert_redirected_to permit_prices_url
  end
end
