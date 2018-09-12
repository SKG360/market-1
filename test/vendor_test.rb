require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'


class VendorTest < Minitest::Test
  def test_if_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_the_vendor_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_if_hash_is_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_if_vendor_stock_is_empty
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_if_the_stock_is_thirty
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 30, vendor.stock("Peaches", 30)
  end

  def test_if_the_stock_of_peaches_equals_fifty_five
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)

    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_if_the_inventory_of_peaches_and_tomatoes_is_accurate
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vendor.inventory
  end

end
