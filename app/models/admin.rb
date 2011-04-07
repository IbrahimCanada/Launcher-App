# == Schema Information
# Schema version: 20110407184241
#
# Table name: admins
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  encrypted_password :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(255)
#  api_key            :string(255)
#

class Admin < ActiveRecord::Base
	attr_accessor   :password
	attr_accessible :email, :password
	
  before_save :encrypt_password
  before_create :create_api_key
	after_create :create_website

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email,  :presence => true,
	 									 :format   => { :with => email_regex },
	 									 :uniqueness => { :case_sensitive => false }
	validates :password, :presence     => true,
                       :length       => { :within => 6..40 }
	
	has_many :websites
	
  
 	scope :businesses,  where(:business_admin => true)
  
  def self.authenticate(email, submitted_password)
    admin = find_by_email(email)
    return nil if admin.nil?
    return admin if admin.has_correct_password?(submitted_password)
    return nil
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
  	admin = find_by_id(id)
  	(admin && admin.salt == cookie_salt) ? admin : nil
  end
  
  def has_correct_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
 
  
  
    

	
	private ###########################################
	
	def create_website
		site = websites.create!
	end
	
	  def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    def create_api_key
    	self.api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..10]
		end
    
end
