# == Schema Information
# Schema version: 20110303194730
#
# Table name: users
#
#  id              :integer         not null, primary key
#  email           :string(255)
#  invite_eligible :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  website_id      :integer
#  link            :string(255)
#  clicks          :integer
#

class User < ActiveRecord::Base

	before_validation :create_link
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email,  :presence => true,
	 									 :format   => { :with => email_regex },
	 									 :uniqueness => { :case_sensitive => false }
	
	belongs_to :website
	
	def increment_clicks
		self.clicks += 1
		self.save
	end
	
	def increment_signups
		self.signups += 1
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
	
end
