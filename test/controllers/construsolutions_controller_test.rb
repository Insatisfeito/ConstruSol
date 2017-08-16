require 'test_helper'

class ConstrusolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construsolution = construsolutions(:one)
  end

  test "should get index" do
    get construsolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_construsolution_url
    assert_response :success
  end

  test "should create construsolution" do
    assert_difference('Construsolution.count') do
      post construsolutions_url, params: { construsolution: {  } }
    end

    assert_redirected_to construsolution_url(Construsolution.last)
  end

  test "should show construsolution" do
    get construsolution_url(@construsolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_construsolution_url(@construsolution)
    assert_response :success
  end

  test "should update construsolution" do
    patch construsolution_url(@construsolution), params: { construsolution: {  } }
    assert_redirected_to construsolution_url(@construsolution)
  end

  test "should destroy construsolution" do
    assert_difference('Construsolution.count', -1) do
      delete construsolution_url(@construsolution)
    end

    assert_redirected_to construsolutions_url
  end
end
