class Image < ActiveRecord::Base
  has_attached_file :img, 
  :styles => { :thumb => "75x75", :small => "150x150" },
  :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
	  
  belongs_to :gallery
  
  validates :title, :presence => true
end