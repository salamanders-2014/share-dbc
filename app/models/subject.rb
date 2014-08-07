class Subject < ActiveRecord::Base
  has_many :resources, through: :subjects_resources
end
