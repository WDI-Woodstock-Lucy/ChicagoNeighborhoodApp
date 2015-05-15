#
# Feature: "User creates a successful search session"
#   Scenario: "User searches for pizza"
#   Given a file named "spec/features/search_function_test.rb" with:
#   """ruby
#   require "rails_helper""
#
#   RSpec.feature "Search capability", :type => :feature do
#     scenario "User searches for pizza"
#     visit '/neighborhoods/show'
#     # or maybe '/neighborhoods/show?utf8=✓&neighborhood_id=[:id]&commit=Explore'
#
#     fill_in "id", :with => "pizza" #search term? What would the field be?
#     click_button "Submit"
#
#     expect(page).to have_text("pizza")
#   end
# end
# """
# When I run 'spec/features/search_function_test.rb'
# Then the exit status should be 0
# And the output should contain "1 example, 0 failures, 1 pending"
# And the output should contain:
# """
#   Pending:
#
#   1) Search capability User searches for pizza
#    #Feature specs require the Capybara (http://github.com/jnicklas/capybara) gem, version 2.2.0 or later. We recommend version 2.4.0 or later to avoid some deprecation warnings and have support for `config.expose_dsl_globally = false`.
#    # ./spec/features/widget_management_spec.rb:4
# """
#
# @capybara
# Scenario: specify creating a Widget by driving the application with capybara
#   Given a file named "spec/features/search_function_test.rb" with:
#   """ ruby
#   require "rails_helper"
#
#   RSpec.feature ""
