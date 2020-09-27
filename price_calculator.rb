class Product
  @@products = {}

  def initialize(name, price)
    @@products[name] = price
  end
  
  def self.all
    return @@products
  end
end


class SaleProduct
  @@sale_products = {}

  # initialize how many units of a product is on sale for the week
  def initialize(name, units, price)

    @@sale_products[name] = { 
      'units' => units, 
      'price' => price 
    }
  end

  def self.all
    return @@sale_products
  end
end


class PriceCalculator

  def generate_bill

    # Take user input of customer items

    puts "Please enter all the items purchased separated by a comma:"
    @customer_items = gets.chomp.split(/,/).map(&:to_s)
    # quanity = @customer_items.count
    # puts quantity

    items_quantity = Hash.new(0)
    @customer_items.each { |item| items_quantity[item] += 1 }

    puts items_quantity

    # if @purchased_items.any?
    #   quantity = count_items
    #   price = calculate_bill(quantity)
    #   display_bill(price, quantity)
    # else 
    #   puts "First add items to generate bill"
    # end
  end

  private

    def count_items
      @purchased_items.inject(Hash.new(0)) do |quantity, item|
        quantity[item] += 1
        quantity
      end
    end


end

begin

  Product.new('milk', 3.97)
  Product.new('bread', 2.17)
  Product.new('banana', 0.99)
  Product.new('apple', 0.89)

  SaleProduct.new('milk',2,5.00)
  SaleProduct.new('bread',3,6.00)

  
  price_calculator = PriceCalculator.new
  price_calculator.generate_bill
end

