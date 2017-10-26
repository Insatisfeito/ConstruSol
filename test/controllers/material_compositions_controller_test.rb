require 'test_helper'

class MaterialCompositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_composition = material_compositions(:one)
  end

  test "should get index" do
    get material_compositions_url
    assert_response :success
  end

  test "should get new" do
    get new_material_composition_url
    assert_response :success
  end

  test "should create material_composition" do
    assert_difference('MaterialComposition.count') do
      post material_compositions_url, params: { material_composition: { construction_cost: @material_composition.construction_cost, description: @material_composition.description, maintenance_cost: @material_composition.maintenance_cost, type: @material_composition.type } }
    end

    assert_redirected_to material_composition_url(MaterialComposition.last)
  end

  test "should show material_composition" do
    get material_composition_url(@material_composition)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_composition_url(@material_composition)
    assert_response :success
  end

  test "should update material_composition" do
    patch material_composition_url(@material_composition), params: { material_composition: { construction_cost: @material_composition.construction_cost, description: @material_composition.description, maintenance_cost: @material_composition.maintenance_cost, type: @material_composition.type } }
    assert_redirected_to material_composition_url(@material_composition)
  end

  test "should destroy material_composition" do
    assert_difference('MaterialComposition.count', -1) do
      delete material_composition_url(@material_composition)
    end

    assert_redirected_to material_compositions_url
  end
end
