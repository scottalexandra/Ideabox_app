class Idea < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :user
end
