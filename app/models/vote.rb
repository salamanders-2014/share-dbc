class Vote < ActiveRecord::Base
  belongs_to :resource
  belongs_to :learning_style
  belongs_to :voter, class_name: "User"

  validates_uniqueness_of :learning_style, scope: [:resource, :voter]
end
