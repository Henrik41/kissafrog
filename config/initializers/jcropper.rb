# Jcropper paperclip processor
#
# This processor very slightly changes the default thumbnail processor in order to work properly with Jcrop
# the jQuery cropper plugin.
 
module Paperclip
  # Handles thumbnailing images that are uploaded.
  class Jcropper < Thumbnail
    
    def transformation_command
      if crop_command
        crop_command + super.join(' ').sub(/ -crop \S+/, '').split(' ')
      else
        super
      end
    end
    

    
    def crop_command
          target = @attachment.instance
          if target.cropping?
            sTransform = "#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}"
            sTransform = ('"'+sTransform+'"')
            trans = []
            trans = trans << "-crop" << sTransform
            trans << "-resize" << "\"800x200\""
            trans 
          end
        end
  
  end
   
end