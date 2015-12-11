require 'test_helper'

class WorkordersControllerTest < ActionController::TestCase
  setup do
    @workorder = workorders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workorders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workorder" do
    assert_difference('Workorder.count') do
      post :create, workorder: { date_of_creation: @workorder.date_of_creation, last_updated_at: @workorder.last_updated_at, status_id: @workorder.status_id, work_details: @workorder.work_details, worker_id: @workorder.worker_id }
    end

    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should show workorder" do
    get :show, id: @workorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workorder
    assert_response :success
  end
  
  test "should get assign" do
    get :assign, id: @workorder
    assert_response :success
  end

  test "should update workorder" do
    patch :update, id: @workorder, workorder: { date_of_creation: @workorder.date_of_creation, last_updated_at: @workorder.last_updated_at, status_id: @workorder.status_id, work_details: @workorder.work_details, worker_id: @workorder.worker_id }
    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should destroy workorder" do
    assert_difference('Workorder.count', -1) do
      delete :destroy, id: @workorder
    end

    assert_redirected_to workorders_path
  end
  
  test "should not create work order" do
    post :create, workorder: { :date_of_creation => '2013-07-29 09:59:47', :last_updated_at => '2013-07-29 09:59:47',  :work_details => '' ,  :status_id => '45', :worker_id => '45'  }
	assert_response :success
  end
  
  test "should not update work order" do
    patch :update, id: @workorder, workorder: { :date_of_creation => '2013-07-29 09:59:47', :last_updated_at => '2013-07-29 09:59:47',  :work_details => '' ,  :status_id => '45', :worker_id => '45'  }
	assert_response :success
  end
  
  test "should test the filter parameter" do
    get :index , :status_id => '2'
    assert_response :success
    assert_not_nil assigns(:workorders)
  end
  
end
