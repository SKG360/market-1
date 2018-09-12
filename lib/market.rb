class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name    = name
    @vendors = []
  end

  def add_vendor(vendor_input)
    @vendors << vendor_input
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    peach_vendors = []
    @vendors.find_all do |vendor|
      if vendor.inventory.include?(item)
        peach_vendors << vendor
      end
    end
    peach_vendors
  end

  def sorted_item_list
    sorted_list = []
    @vendors.each do |vendor|
      sorted_list << vendor.inventory.keys
    end
    alpha_sorted_list = sorted_list.flatten.uniq
    alpha_sorted_list.sort
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
       vendor.inventory.each do |item, quantity|
         if inventory[item].nil?
         inventory[item] = quantity
         else
          inventory[item] += quantity
         end
       end
     end
     inventory
  end


end
