require 'test_helper'

class TraceroutesControllerTest < ActionController::TestCase
  setup do
    @traceroute = traceroutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traceroutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traceroute" do
    assert_difference('Traceroute.count') do
      post :create, traceroute: { exit_status: @traceroute.exit_status, local_ip: @traceroute.local_ip, stderr: @traceroute.stderr, stdout: @traceroute.stdout, timestamp: @traceroute.timestamp }
    end

    assert_redirected_to traceroute_path(assigns(:traceroute))
  end

  test "should show traceroute" do
    get :show, id: @traceroute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traceroute
    assert_response :success
  end

  test "should update traceroute" do
    patch :update, id: @traceroute, traceroute: { exit_status: @traceroute.exit_status, local_ip: @traceroute.local_ip, stderr: @traceroute.stderr, stdout: @traceroute.stdout, timestamp: @traceroute.timestamp }
    assert_redirected_to traceroute_path(assigns(:traceroute))
  end

  test "should destroy traceroute" do
    assert_difference('Traceroute.count', -1) do
      delete :destroy, id: @traceroute
    end

    assert_redirected_to traceroutes_path
  end
end
