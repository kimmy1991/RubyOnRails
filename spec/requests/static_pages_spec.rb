require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }


	it "should have the right links on the layout" do
		visit home_path
		click_link "About"
		page.should have_selector 'title', text: full_title('About Us') 
		click_link "Help"
		page.should have_selector 'title', text: full_title('Help') 
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact') 
		click_link "Home"
		click_link "Sign up now!"
		page.should have_selector 'title', text: full_title('Sign up') 
		click_link "sample app"
		page.should have_selector 'title', text: 'Sample App'
		
	end
	describe "Home page" do

		it "should have the h1 'Sample App'" do
			visit home_path
			page.should have_selector('h1', :text => 'Sample App')
		end
		it "should have the base title" do 
			visit '/static_pages/home' 
			#page.should have_selector('title', :text => "#{base_title}")
			page.should have_selector('title', :text => full_title(''))

		end 
		it "should not have a custom page title" do
			visit '/static_pages/home'
			page.should_not have_selector('title', :text => '| Home')
		end
	end

	describe "Help page" do
		before {visit help_path}

		it "should have the h1 'Help'" do
			#visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')
		end
		
		it "should have the title 'Help'" do 
			#visit '/static_pages/help' 
			page.should have_selector('title', :text => "#{base_title} | Help")
		end 
	end


	describe "About page" do
		it "should have the h1 'About Us'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About Us')
		end

		it "should have the title 'About'" do 
			visit '/static_pages/about' 
			page.should have_selector('title', :text => "#{base_title} | About Us")
		end 
		
	end

	describe "Contact page" do
		it "should have the h1 'Contact Us'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact')
		end

		it "should have the title 'Contact Us'" do 
			visit '/static_pages/contact' 
			page.should have_selector('title', :text => "#{base_title} | Contact")
		end 
		
	end

end

