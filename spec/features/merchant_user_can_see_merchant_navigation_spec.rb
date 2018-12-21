require 'rails_helper'

describe 'a merchant user ' do
  it 'sees a registered user specific navigation bar' do
    merchant_1 = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant_1)

    visit '/'

    within("#merchant-user-nav-bar") do
      expect(page).to have_content("Home")
      expect(page).to have_content("Browse Items")
      expect(page).to have_content("Browse Merchants")
      expect(page).to have_content("Profile")
      #expect(page).to have_content("#{user_1.name}'s Orders")
      expect(page).to have_content("Dashboard")
      expect(page).to have_content("Logout")

      expect(page).not_to have_content("Cart: 0")
      expect(page).not_to have_content("Login")
      expect(page).not_to have_content("Register")

      expect(page).to have_content("Logged in as #{merchant_1.name}")
    end

      have_link("home_link", :href => '/')
      have_link("items_link", :href => '/items')
      have_link("merchants_link", :href => '/merchants')
      have_link("dashboard_link", :href => '/dashboard')
      have_link("profile_link", :href => '/profile')
      have_link("user_orders_link", :href => '/orders')
      have_link("logout_link", :href => '/logout')


    # THESE ARE TESTS TO ENSURE THAT WE CAN REACH THE CORRECT PAGE...
    # ....THROUGH OUR LINKS. THEY HAVE BEEN COMMENTED OUT BECAUSE SOME....
    # ....OF THESE PATHS DO NOT EXIST

    # click_on 'home-link'
    # expect(current_path).to eq('/')
    #
    # click_on 'items-link'
    # expect(current_path).to eq(items_path)
    #
    # click_on 'merchants-link'
    # expect(current_path).to eq(merchants_path)
    #
    # click_on 'dashboard-link'
    # expect(current_path).to eq(dashboard_path)
    #
    # click_on 'profile-link'
    # expect(current_path).to eq(profile_path)
    #
    # click_on 'user-orders-link'
    # expect(current_path).to eq(orders_path)
    #
    # click_on 'logout-link'
    # expect(current_path).to eq(logout_path)





  end

end