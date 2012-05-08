class Image < ActiveRecord::Base
  has_attached_file :img, :styles => { :thumb => "75x75", :small => "150x150" }
  
  belongs_to :gallery
  
  validates :gallery_id, :presence => true
end
