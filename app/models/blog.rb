class Blog < ActiveRecord::Base
	attr_accessible :userid, :title, :post

 validates_uniqueness_of :title
	
end
