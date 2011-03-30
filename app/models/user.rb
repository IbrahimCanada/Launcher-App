# == Schema Information
# Schema version: 20110330185539
#
# Table name: users
#
#  id                :integer         not null, primary key
#  email             :string(255)
#  invite_eligible   :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  website_id        :integer
#  link              :string(255)
#  clicks            :integer         default(0)
#  signups           :integer         default(0)
#  invite            :boolean
#  confirmation_code :string(255)
#  confirmed         :boolean
#  referrer_id       :integer
#

class User < ActiveRecord::Base

	before_validation :create_link
	before_create :create_confirmation_code
	
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email,  :presence => true,
	 									 :format   => { :with => email_regex }
	 									 
	validates_uniqueness_of :email, :scope => :website_id
	
	belongs_to :website
	
	default_scope :order => 'users.signups DESC'
	
	def increment_clicks
		self.clicks += 1
		self.save
	end
	
	def increment_signups
		self.signups += 1
		invite_user if self.signups >= 3
		self.save
	end
	
	def set_referrer_id(referrer_id)
		self.referrer_id = referrer_id
		self.save
	end
	
	def confirm
		self.confirmed = true
		self.save
	end
	
	private #############################
	
		def create_link
			if link == nil	
				begin
					random_link = (0..9).to_a.shuffle[0..5].join
				end while User.find_by_link(random_link) != nil
				self.link = random_link
			end
		end
		
		def invite_user
			self.invite = true
		end
		
		def create_confirmation_code
			self.confirmation_code = Digest::SHA1.hexdigest([Time.now, rand].join)
		end
end
