require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  include Capybara::DSL
  # test "it edits an idea" do
  #   user = User.create(username: "username", password: "password", role: 1)
  #   idea = user.ideas.create(title: "title", description: "description")
  #   old_idea_title = idea.title
  #   ApplicationController.any_instance.stubs(:current_user).returns(user)
  #   visit user_path(user)
  #   click_link_or_button 'Edit'
  #   fill_in "idea[title]", with: 'new title'
  #   click_link_or_button 'Update'
  #   # save_and_open_page
  #   assert_equal user_path(user), current_path
  #   within("#idea_list") do
  #     assert page.has_content?('new title')
  #   end
  # end
end
