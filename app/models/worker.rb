class Worker < ActiveRecord::Base
  has_many :workorders
  validates_presence_of :first_name , :last_name
  validates_format_of :first_name, :last_name, :with => /\A([A-Za-z]*)[.\s]*[A-Za-z]+\z/  
end
