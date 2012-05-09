class Gallery < ActiveRecord::Base
  has_many :images
  
  validates :title, :presence => true
  validates :description, :presence => true
end