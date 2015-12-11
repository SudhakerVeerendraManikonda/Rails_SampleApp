class Workorder < ActiveRecord::Base
  belongs_to :worker
  belongs_to :status
  validates_presence_of :worker, :status ,:work_details 
  
  def self.search(selected_status)
	Workorder.where("status_id = #{selected_status}" )		
  end  
end
