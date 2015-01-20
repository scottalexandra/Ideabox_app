require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "it is valid" do
    idea = Idea.create(title: "title", description: "description")
    assert idea.valid?
  end

  test "it is not valid" do
    idea = Idea.create(title: nil, description: nil)
    refute idea.valid?
  end
end
