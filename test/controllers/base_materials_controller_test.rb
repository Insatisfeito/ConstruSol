require 'test_helper'

class BaseMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_material = base_materials(:one)
  end

  test "should get index" do
    get base_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_base_material_url
    assert_response :success
  end

  test "should create base_material" do
    assert_difference('BaseMaterial.count') do
      post base_materials_url, params: { base_material: { adp: @base_material.adp, ap: @base_material.ap, description: @base_material.description, enr: @base_material.enr, ep: @base_material.ep, er: @base_material.er, gwp: @base_material.gwp, lambda: @base_material.lambda, odp: @base_material.odp, pocp: @base_material.pocp } }
    end

    assert_redirected_to base_material_url(BaseMaterial.last)
  end

  test "should show base_material" do
    get base_material_url(@base_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_base_material_url(@base_material)
    assert_response :success
  end

  test "should update base_material" do
    patch base_material_url(@base_material), params: { base_material: { adp: @base_material.adp, ap: @base_material.ap, description: @base_material.description, enr: @base_material.enr, ep: @base_material.ep, er: @base_material.er, gwp: @base_material.gwp, lambda: @base_material.lambda, odp: @base_material.odp, pocp: @base_material.pocp } }
    assert_redirected_to base_material_url(@base_material)
  end

  test "should destroy base_material" do
    assert_difference('BaseMaterial.count', -1) do
      delete base_material_url(@base_material)
    end

    assert_redirected_to base_materials_url
  end
end
