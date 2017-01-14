require 'rails_helper'

module Pwb
  RSpec.describe "Admin panel", type: :feature, js: true do
    before(:all) do
      @admin_user = User.create!(email: "user@example.org", password: "very-secret", admin: true)
      @prop_for_long_term_rent = FactoryGirl.create(
        :pwb_prop,
        :long_term_rent,
        price_rental_monthly_current_cents: 100_000,
        reference: "ref_pfltr"
      )
    end

    scenario 'sign in works' do
      visit('/admin')
      # puts current_url
      # require 'pry'; binding.pry
      # save_and_open_page
      fill_in('Email', with: @admin_user.email)
      fill_in('Password', with: @admin_user.password)
      click_button('Sign in')
      # visit('/admin')

      # expect(page).to have_css(".main-menu", count: 1)

      # expect(last('.card').find('h2')).to have_content('Website')
      expect(page).to have_link('Add a property')
    end

    # after(:all) do
    #   @prop_for_long_term_rent.destroy
    # end
  end
end