class Gallery < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:img].blank? }, :allow_destroy => true
  
  validates :title, :presence => true
  validates :description, :presence => true
end