class Subject < ActiveRecord::Base
  has_many :subject_resources
  has_many :resources, through: :subject_resources
  validates_presence_of :name
  validates :name, length: { minimum: 2}
end
