class User < ActiveRecord::Base

  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  acts_as_messageable
  attr_reader :sendmymail
  # Setup accessible (or protected) attributes for your model
  attr_accessible :sex, :name, :country, :city, :province, :birthdate, :email, :password, :password_confirmation, :remember_me, :wherelive
  attr_accessor :wherelive
  has_many :albums,  :dependent => :destroy
  has_one :xtra, :dependent => :destroy
  has_one :saysomething, :dependent => :destroy
  accepts_nested_attributes_for :saysomething
  validates_presence_of :sex, :name,  :wherelive
  validates_uniqueness_of :name
  
  
  def name
   return :name
  end
  
  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return :email
    #if false
    #return nil
  end

end
