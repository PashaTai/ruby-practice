class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |item_name| item_name[:name] }.flatten.sort
  end

  def cheap
    @items.select { |item_price| item_price[:price] < 30.00 }
  end

  def out_of_stock
    @items.select { |quantity_by_size| quantity_by_size[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    @name = name
    @items.find { |name| name[:name] == @name } [:quantity_by_size]
  end

  def total_stock
    @items.sum { |item| item[:quantity_by_size].values.sum }
  end

  private

  attr_reader :items
end