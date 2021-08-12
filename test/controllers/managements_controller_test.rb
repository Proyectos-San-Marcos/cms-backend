require "test_helper"

class ManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @management = managements(:one)
  end

  test "should get index" do
    get managements_url, as: :json
    assert_response :success
  end

  test "should create management" do
    assert_difference('Management.count') do
      post managements_url, params: { management: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show management" do
    get management_url(@management), as: :json
    assert_response :success
  end

  test "should update management" do
    patch management_url(@management), params: { management: {  } }, as: :json
    assert_response 200
  end

  test "should destroy management" do
    assert_difference('Management.count', -1) do
      delete management_url(@management), as: :json
    end

    assert_response 204
  end
end
