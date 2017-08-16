require 'test_helper'

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get materials_url
    assert_response :success
  end

  test "should get new" do
    get new_material_url
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post materials_url, params: { material: { adp: @material.adp, ap: @material.ap, cost: @material.cost, e: @material.e, enr: @material.enr, ep: @material.ep, er: @material.er, gwp: @material.gwp, lambda: @material.lambda, name: @material.name, odp: @material.odp, popc: @material.popc, weight: @material.weight } }
    end

    assert_redirected_to material_url(Material.last)
  end

  test "should show material" do
    get material_url(@material)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_url(@material)
    assert_response :success
  end

  test "should update material" do
    patch material_url(@material), params: { material: { adp: @material.adp, ap: @material.ap, cost: @material.cost, e: @material.e, enr: @material.enr, ep: @material.ep, er: @material.er, gwp: @material.gwp, lambda: @material.lambda, name: @material.name, odp: @material.odp, popc: @material.popc, weight: @material.weight } }
    assert_redirected_to material_url(@material)
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete material_url(@material)
    end

    assert_redirected_to materials_url
  end
end
