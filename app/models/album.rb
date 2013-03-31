class Album < ActiveRecord::Base
  attr_accessible :description, :setting, :user_id
end
