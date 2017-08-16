require 'test_helper'

class ConstrusolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construsol = construsols(:one)
  end

  test "should get index" do
    get construsols_url
    assert_response :success
  end

  test "should get new" do
    get new_construsol_url
    assert_response :success
  end

  test "should create construsol" do
    assert_difference('Construsol.count') do
      post construsols_url, params: { construsol: {  } }
    end

    assert_redirected_to construsol_url(Construsol.last)
  end

  test "should show construsol" do
    get construsol_url(@construsol)
    assert_response :success
  end

  test "should get edit" do
    get edit_construsol_url(@construsol)
    assert_response :success
  end

  test "should update construsol" do
    patch construsol_url(@construsol), params: { construsol: {  } }
    assert_redirected_to construsol_url(@construsol)
  end

  test "should destroy construsol" do
    assert_difference('Construsol.count', -1) do
      delete construsol_url(@construsol)
    end

    assert_redirected_to construsols_url
  end
end
