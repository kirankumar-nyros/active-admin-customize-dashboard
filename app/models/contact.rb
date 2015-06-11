class Contact < ActiveRecord::Base
	
	validates_presence_of :Name, :Age, :Email, :Company
	validates_uniqueness_of :Name, :Email
	validates_format_of :Email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :groups
end

