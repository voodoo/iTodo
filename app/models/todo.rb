class Todo < ActiveRecord::Base
 has_many :items, :dependent => :destroy
 include TokenGenerator
 before_create :set_token
 after_create do |todo|
   todo.items.create(:body => "Bookmark this page so you can come back and edit")
 end  
 def completes
   items.find_all_by_complete(true)
 end
 def incompletes
   items.find_all_by_complete(false)
 end 
 def to_param
   token
 end
end