require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it is valid" do
    user = User.create(username: "alex", password: "password")
    assert user.valid?
  end

  test "it is not valid" do
    user = User.create(username: nil, password: "password")
    refute user.valid?
  end

  test "it has ideas" do
    user = User.create(username: "alex", password: "password")
    user.ideas.create(title: "title", description: "description")
    user.ideas.create(title: "title1", description: "description2")
    assert_equal 2, user.ideas.count
    assert_equal "title", user.ideas.first.title
  end
end
