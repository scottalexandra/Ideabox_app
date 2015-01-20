require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "it allows a registered user to login" do
    user = User.create(username: "username", password: "password")
    visit login_path
    fill_in "session[username]", with: "username"
    fill_in "session[password]", with: "password"
    click_link_or_button "Login"
    within("#flash_notice") do
      assert has_content?("Successfully Logged In")
    end
  end

  test "it does not allow an unregistered user to login" do
    visit login_path
    fill_in "session[username]", with: nil
    fill_in "session[password]", with: nil
    click_link_or_button "Login"
    within("#flash_error") do
      assert has_content?("Invalid Login")
    end
  end

  test "an unregisted user cannot view a users page" do
    user = User.create(username: "alex", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(nil)
    visit user_path(user)
    within ("#flash_alert") do
      assert has_content?("Not Authorized")
    end
  end

  test "a registered user can view their own profile" do
    user = User.create(username: "alex", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within ("#welcome") do
      assert has_content?("Welcome Alex")
    end
  end

  test "a registered user cannot view another users profile" do
    user = User.create(username: "alex", password: "password")
    protected_user = User.create(username: "murphy", password: "password1")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(protected_user)
    within ("#flash_alert") do
      assert has_content?("You are not authorized to access this page")
    end
  end

  test "a registered user can edit their own ideas" do
    user = User.create(username: "alex", password: "password")
    user.ideas.create(title: "title", description: "description")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    click_link_or_button "Edit"
    fill_in "idea[title]", with: "new title"
    click_link_or_button "Update"
    assert_equal user_path(user), current_path
    within ("#idea_list") do
      assert has_content?("new title")
    end
  end

  test "a registered user can create an idea" do
    user = User.create(username: "alex", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    click_link_or_button "Add New Idea"
    fill_in "idea[title]", with: "an idea"
    fill_in "idea[description]", with: "description of an idea"
    click_link_or_button "Submit"
    assert_equal user_path(user), current_path
    within ("idea_list") do
      assert has_content?("an idea")
      assert has_content?("description of an idea")
    end
  end


end
