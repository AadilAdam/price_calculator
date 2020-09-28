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

    items_quantity = Hash.new(0)
    @customer_items.each { |item| items_quantity[item] += 1 }
    bill_summary = calculate_total_bill(items_quantity)

  end

  private
  def calculate_total_bill(items_quantity)
    # puts items_quantity
    summary = Hash.new()
    items_quantity.each do |product, value|
      # puts product
      # puts value
      # puts "******"
      selling_price = Product.all[product]
      sale_details = SaleProduct.all[product]
      # puts selling_price
      # puts sale_details
      if sale_details.empty?
        cost_price = items_quantity[product] * selling_price
      else
        discount_price = (items_quantity[product] / sale_details['units']) * sale_details['price']
        cost_price =  discount_price +  ((items_quantity[product] % sale_details['units']) * selling_price)
      end
      summary[product] = cost_price
    end
    return summary
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

