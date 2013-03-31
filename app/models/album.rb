class Album < ActiveRecord::Base
  attr_accessible :description, :setting, :user_id
  belongs_to :user, :dependent => :destroy
  attr_accessible :avatar

  AVATAR_SW = 55
  AVATAR_SH = 55
  AVATAR_NW = 240
  AVATAR_NH = 240

  has_attached_file :avatar,
        :styles => { :normal => ["#{AVATAR_NW}x#{AVATAR_NH}>", :jpg],
                     :small => ["#{AVATAR_SW}x#{AVATAR_SH}#", :jpg], 
                     :medium => "300x300>", :thumb => "100x100>" },
                     
        :default_url => "/images/:style/missing.png",
                     
        :processors => [:jcropper]

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']

  after_update :reprocess_avatar, :if => :cropping?

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(path)
  end

  private

  def reprocess_avatar
    avatar.reprocess!
  end
  
end
