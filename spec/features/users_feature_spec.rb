require 'rails_helper'

RSpec.describe UsersController do

  #Testing Show!!!!
  describe 'viewing a user' do
  	describe 'given a user' do
  		before do
  			@matt = User.create(email: 'Matt@matt.com', password:'banana')

  		end
      describe 'as a signed in user' do
        before do
          page.set_rack_session(:user_id => @matt.id)
        end
    		describe 'on a users show page' do
    			before do
    				visit user_path(@matt)
    			end
    			it "shows the users email" do
    				expect(page).to  have_content('Matt@matt.com')
    			end
    		end
      end
  	end
  end
end
