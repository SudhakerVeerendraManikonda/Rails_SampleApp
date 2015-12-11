class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    @workers = Worker.all
  end

  def show
	@workorders = Workorder.where("worker_id = #{@worker.id}")
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }        
      else
        format.html { render action: 'new' }        
      end
    end
  end

  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }        
      else
        format.html { render action: 'edit' }        
      end
    end
  end

  def destroy
    respond_to do |format|
	  if ( Workorder.where("worker_id = #{@worker.id}").count == 0 )
		@worker.destroy
		format.html { redirect_to workers_url }		
	  else
	    format.html { redirect_to workers_url, notice:'Cannot Delete the worker.Worker has Work Order Assigned. ' }
	  end
    end
  end

  private    
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name, :last_name)
    end
end
