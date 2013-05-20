class Album < ActiveRecord::Base
  attr_accessible :description, :setting, :user_id
  
  attr_accessible :avatar
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  AVATAR_SW = 155
  AVATAR_SH = 155
  AVATAR_NW = 340
  AVATAR_NH = 340

  has_attached_file :avatar,
        :styles => {
                    :original => {:geometry => "#{AVATAR_NW}x#{AVATAR_NH}>"},
                    :normal => {:geometry => "#{AVATAR_NW}x#{AVATAR_NH}>",  :processors => [:jcropper]},
                     :small => { :geometry => "#{AVATAR_SW}x#{AVATAR_SH}#"}, 
                     :medium => {:geometry =>  "700x700>"}, :thumb => {:geometry => "200x200>" }
                      
}
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']



  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end

  
  private

  def reprocess_avatar
    avatar.reprocess!
  end
  
  belongs_to :user
  
  
end
