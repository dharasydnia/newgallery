class Image < ActiveRecord::Base
  has_attached_file :img, 
  :styles => { :thumb => "75x75#", :small => "150x150>" },
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => "/:style/:id/:filename"
	  
  belongs_to :gallery
  
  validates :title, :presence => true
end