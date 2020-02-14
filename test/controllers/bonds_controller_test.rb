require 'test_helper'

class BondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bond = bonds(:one)
  end

  test "should get index" do
    get bonds_url
    assert_response :success
  end

  test "should get new" do
    get new_bond_url
    assert_response :success
  end

  test "should create bond" do
    assert_difference('Bond.count') do
      post bonds_url, params: { bond: { name: @bond.name, term: @bond.term, type: @bond.type, yield: @bond.yield } }
    end

    assert_redirected_to bond_url(Bond.last)
  end

  test "should show bond" do
    get bond_url(@bond)
    assert_response :success
  end

  test "should get edit" do
    get edit_bond_url(@bond)
    assert_response :success
  end

  test "should update bond" do
    patch bond_url(@bond), params: { bond: { name: @bond.name, term: @bond.term, type: @bond.type, yield: @bond.yield } }
    assert_redirected_to bond_url(@bond)
  end

  test "should destroy bond" do
    assert_difference('Bond.count', -1) do
      delete bond_url(@bond)
    end

    assert_redirected_to bonds_url
  end
end
