class Gallery < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  validates :title, :presence => true
  validates :description, :presence => true
end