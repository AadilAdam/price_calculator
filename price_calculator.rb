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

