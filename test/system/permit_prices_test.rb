# frozen_string_literal: true

require 'application_system_test_case'

class PermitPricesTest < ApplicationSystemTestCase
  setup do
    @permit_price = permit_prices(:one)
  end

  test 'visiting the index' do
    visit permit_prices_url
    assert_selector 'h1', text: 'Permit Prices'
  end

  test 'creating a Permit price' do
    visit permit_prices_url
    click_on 'New Permit Price'

    fill_in 'Permit', with: @permit_price.permit_id
    fill_in 'Price', with: @permit_price.price
    click_on 'Create Permit price'

    assert_text 'Permit price was successfully created'
    click_on 'Back'
  end

  test 'updating a Permit price' do
    visit permit_prices_url
    click_on 'Edit', match: :first

    fill_in 'Permit', with: @permit_price.permit_id
    fill_in 'Price', with: @permit_price.price
    click_on 'Update Permit price'

    assert_text 'Permit price was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Permit price' do
    visit permit_prices_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Permit price was successfully destroyed'
  end
end
