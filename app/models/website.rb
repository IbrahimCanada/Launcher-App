# == Schema Information
# Schema version: 20110301210525
#
# Table name: websites
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  admin_id   :integer
#  header     :string(255)
#  content    :text
#

class Website < ActiveRecord::Base

	before_validation :create_url
	
	validates :url, :presence => true,
									:length => { :maximum => 6, :minimum => 6 }
	
	has_many :users
	belongs_to :admin
	
	
	
	private ###################################
	
	def create_url
		if url == nil	
			begin
				random_url = ('a'..'z').to_a.shuffle[0..5].join
			end while Website.find_by_url(random_url) != nil
			self.url = random_url
		end
	end
end
