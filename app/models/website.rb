# == Schema Information
# Schema version: 20110315171449
#
# Table name: websites
#
#  id                :integer         not null, primary key
#  url               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  admin_id          :integer
#  header            :string(255)
#  content           :text
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Website < ActiveRecord::Base

	before_validation :create_url
	
	validates :url, :presence => true,
									:length => { :maximum => 6, :minimum => 6 }
	
	has_many :users
	belongs_to :admin
	
	has_attached_file :logo, :storage => :s3, :bucket => 'mybucket', :s3_credentials => {:access_key_id => ENV['AKIAIPF5UI3OMTUMT7DQ'], 
	:secret_access_key => ENV['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']
    }#, :path => ":attachment/:id/:style.:extension" #, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	
	
	
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
