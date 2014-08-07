class LearningStyle < ActiveRecord::Base
  has_many :resources, through: :learning_styles_resources
end
