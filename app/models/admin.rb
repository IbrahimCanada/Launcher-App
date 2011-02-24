# == Schema Information
# Schema version: 20110224173313
#
# Table name: admins
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  encrypted_password :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Admin < ActiveRecord::Base
	after_create :create_website

	validates :email,              :presence => true
	validates :encrypted_password, :presence => true
	
	has_many :websites
	
	private ###########################################
	
	def create_website
		site = websites.create!
	end
end
