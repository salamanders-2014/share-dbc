class SubjectResource < ActiveRecord::Base
	belongs_to :subject
  belongs_to :resource
end
