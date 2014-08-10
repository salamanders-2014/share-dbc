class LearningStyle < ActiveRecord::Base
  has_many :learning_style_resources
  has_many :resources, through: :learning_style_resources
  has_many :votes

  validates_presence_of :name
end
