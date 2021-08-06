def read(file)
  [
    [ 1, 'book', 12.49 ],
    [ 1, 'music cd', 14.99 ],
    [ 1, 'chocolate bar', 0.85 ],
  ]
end

class Taxer
  BASE_TAX      = 0.1
  IMPORTED_TAX  = 0.05
  EXCLUDE = ['pills', 'chocolate', 'book'].freeze

  def initialize(item)
    @item = item
  end

  def tax
    b_tax = exclude? ? 0 : BASE_TAX
    i_tax = @item.imported? ? IMPORTED_TAX : 0

    taxes = b_tax + i_tax

    @item.price * taxes
  end

  def exclude?
    EXCLUDE.any? { |e| @item.product.include?(e) }
  end
end

Item = Struct.new(:quantity, :product, :unit_price) do
  def to_s
    "#{ quantity }, #{ product }, #{ sub_total }"
  end

  def price
    (quantity * unit_price).round(2)
  end

  def sub_total
    ( price + tax ).round(2)
  end

  def tax
    Taxer.new(self).tax
  end

  def imported?
    product.match?(/^imported/)
  end
end

def main(input)
  total = 0
  taxes = 0

  input.map{ |i| Item.new(i[0], i[1], i[2]) }.each do |item|
    total += item.sub_total
    taxes += item.tax

    puts item.to_s
  end

  puts "Sales Taxes: #{ taxes }"
  puts "Total: #{ total }"
end

input_1 = [
  [ 1, 'book', 12.49 ],
  [ 1, 'music cd', 14.99 ],
  [ 1, 'chocolate bar', 0.85 ],
]

input_2 = [
  [ 1, 'imported box of chocolates', 10.00 ],
  [ 1, 'imported bottle of perfume', 47.50 ]
]

input_3 = [
  [ 1, 'imported bottle of perfume', 27.99 ],
  [ 1, 'bottle of perfume', 18.99 ],
  [ 1, 'packet of headache pills', 9.75 ],
  [ 1, 'imported box of chocolates', 11.25 ],
]

main(input_1)
p ''
main(input_2)
p ''
main(input_3)
