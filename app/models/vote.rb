class Vote < ActiveRecord::Base
  belongs_to :resource
  has_one :learning_style
  belongs_to :voter, class_name: "User"
end