class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    def sum
    item.add_tax_price*amount
    end
end
