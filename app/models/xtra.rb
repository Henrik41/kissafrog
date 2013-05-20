class Xtra < ActiveRecord::Base
  attr_accessible :picid, :user_id, :setting
  belongs_to :user
end
