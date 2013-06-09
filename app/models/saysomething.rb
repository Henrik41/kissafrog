class Saysomething < ActiveRecord::Base
  attr_accessible :headlines, :interests, :say, :user_id
  belongs_to :user
end
