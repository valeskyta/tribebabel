require 'test_helper'

class InvitationListsControllerTest < ActionController::TestCase
  setup do
    @invitation_list = invitation_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitation_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitation_list" do
    assert_difference('InvitationList.count') do
      post :create, invitation_list: { event_id: @invitation_list.event_id, status: @invitation_list.status, user_id: @invitation_list.user_id }
    end

    assert_redirected_to invitation_list_path(assigns(:invitation_list))
  end

  test "should show invitation_list" do
    get :show, id: @invitation_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invitation_list
    assert_response :success
  end

  test "should update invitation_list" do
    patch :update, id: @invitation_list, invitation_list: { event_id: @invitation_list.event_id, status: @invitation_list.status, user_id: @invitation_list.user_id }
    assert_redirected_to invitation_list_path(assigns(:invitation_list))
  end

  test "should destroy invitation_list" do
    assert_difference('InvitationList.count', -1) do
      delete :destroy, id: @invitation_list
    end

    assert_redirected_to invitation_lists_path
  end
end
