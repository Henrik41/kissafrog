class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :sex, :name, :country, :city, :province, :birthdate, :email, :password, :password_confirmation, :remember_me, :wherelive
  attr_accessor :wherelive
  has_many :albums,  :dependent => :destroy
  has_one :xtra, :dependent => :destroy
  has_one :saysomething, :dependent => :destroy
  accepts_nested_attributes_for :saysomething
end
