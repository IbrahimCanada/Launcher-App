# == Schema Information
# Schema version: 20110224194142
#
# Table name: websites
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  admin_id   :integer
#

class Website < ActiveRecord::Base

	before_validation :create_url
	
	validates :url, :presence => true,
									:length => { :maximum => 6, :minimum => 6 }
	
	belongs_to :admin
	
	
	
	private ###################################
	
	def create_url
		self.url = ('a'..'z').to_a.shuffle[0..5].join
	end
end
