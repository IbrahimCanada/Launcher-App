#Factory.define :user do |user|
#  user.name                  "Jay Wengrowsky"
#  user.email                 "jaywengrow@example.edu"
#  user.password              "password"
#  user.password_confirmation "password"
#  user.business_user					false
#end

#Factory.sequence :email do |n|
#	"person-#{n}@example.com"
#end

#Factory.sequence :name do |n|
#	"John Boothington #{n}"
#end

#Factory.define :commercial do |commercial|
#	commercial.transcript "This is the transcript!"
#	commercial.title "This is a stupid title."
#	commercial.association :user
#end

Factory.define :admin do |admin|
	admin.email    "admin@example.org"
	admin.password "password"
end
