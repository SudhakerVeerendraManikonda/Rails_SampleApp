require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  setup do
    @worker = workers(:John)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create, worker: { first_name: @worker.first_name, last_name: @worker.last_name }
    end

    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should show worker" do
    get :show, id: @worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worker
    assert_response :success
  end

  test "should update worker" do
    patch :update, id: @worker, worker: { first_name: @worker.first_name, last_name: @worker.last_name }
    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
	  @new_worker = workers(:David)
      delete :destroy, id: @new_worker
    end
    assert_redirected_to workers_path
  end
  
  test "should not destroy worker if work order assigned" do
	assert_no_difference('Worker.count') do	  
      delete :destroy, id: @worker
    end
    assert_redirected_to workers_path
  end
  
  test "should not create worker" do
    post :create, worker: { :first_name => '123', :last_name => '456' }
	assert_response :success
  end
  
  test "should not update worker" do
    patch :update, id: @worker, worker: { :first_name => '123', :last_name => '456' }
	assert_response :success
  end
end
