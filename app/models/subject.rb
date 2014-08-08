class Subject < ActiveRecord::Base
  has_many :resources, through: :subjects_resources
  validates_presence_of :name
  validates :name, length: { minimum: 2}
end
