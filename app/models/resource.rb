class Resource < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :learning_style_resources
  has_many :learning_styles, through: :learning_style_resources
  has_many :subject_resources
  has_many :subjects, through: :subject_resources

  validates_presence_of :link #
  validates_presence_of :title #
  validates_length_of :title, minimum: 4 #
  validates_length_of :link, minimum: 6 #


  # validates :link, presence: true, length: {minimum: 6}
  # validates :title, presence: true, length: {minimum: 4}

  before_validation(on: :create) do
    http_stripper #<--don't know how to test on before validation explicitly x
  end


  def http_stripper
    self.link = self.link.gsub(/^\w*\:*\/+/, "") if attribute_present?("link")
  end
end
