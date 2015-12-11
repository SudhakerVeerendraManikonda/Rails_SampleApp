class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy, :assign]

  def index   
    if(params.has_key?(:status_id))
		@selected_status = params[:status_id]  
		@workorders = Workorder.search(@selected_status)
	else
		@workorders = Workorder.all
	end		
  end

  def show
	@worker = Worker.find_by_id(@workorder.worker_id)	
	@workorders = Workorder.where("worker_id = #{@worker.id}")
  end

  def new
    @workorder = Workorder.new
  end

  def edit
	@workorder.last_updated_at =DateTime.now
  end  
  
  def assign
	@workorder.last_updated_at =DateTime.now
  end

  def create
    @workorder = Workorder.new(workorder_params)

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to @workorder, notice: 'Workorder was successfully created.' }        
      else
        format.html { render action: 'new' }        
      end
    end
  end

  def update
    respond_to do |format|
      if @workorder.update(workorder_params)
        format.html { redirect_to @workorder, notice: 'Workorder was successfully updated.' }        
      else
        format.html { render action: 'edit' }        
      end
    end
  end

  def destroy
    @workorder.destroy
    respond_to do |format|
      format.html { redirect_to workorders_url }
      format.json { head :no_content }
    end
  end

  private    
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end
    
    def workorder_params
      params.require(:workorder).permit(:work_details, :worker_id, :status_id, :date_of_creation, :last_updated_at)
    end
end
