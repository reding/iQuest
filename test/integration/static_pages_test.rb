require 'test_helper'

describe "Static pages" do
	describe "Home page" do
		it "should have the content 'forTest2'" do
			visit '/static_pages/home'
			expect(page).to have_content('forTest2')
		end
	end
end