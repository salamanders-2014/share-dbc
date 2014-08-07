class LearningStyleResources < ActiveRecord::Base
  belongs_to :learning_style
  belongs_to :resource
end
