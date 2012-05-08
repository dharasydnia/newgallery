<<<<<<< HEAD
class Image < ActiveRecord::Base
  has_attached_file :img, :styles => { :thumb => "75x75", :small => "150x150" }
  
  belongs_to :gallery
  
  validates :gallery_id, :presence => true
end
=======
class Image < ActiveRecord::Base
  has_attached_file :img, :styles => { :thumb => "75x75", :small => "150x150" }
  
  belongs_to :gallery
  
  validates :gallery_id, :presence => true
end
>>>>>>> 27f4df6c849ec0a8cc5ee12c7d95b61bc393fdf4
