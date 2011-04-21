# == Schema Information
# Schema version: 20110405200529
#
# Table name: websites
#
#  id                      :integer         not null, primary key
#  url                     :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  admin_id                :integer
#  header                  :string(255)
#  content                 :text
#  logo_file_name          :string(255)
#  logo_content_type       :string(255)
#  logo_file_size          :integer
#  logo_updated_at         :datetime
#  background_file_name    :string(255)
#  background_content_type :string(255)
#  background_file_size    :integer
#  background_updated_at   :datetime
#  domain_name             :string(255)
#

class Website < ActiveRecord::Base

	before_validation :create_url

	
	validates :url, :uniqueness => { :case_sensitive => false }, :presence => true
	
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
