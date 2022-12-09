class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
    # def sum
    # item.add_tax_price*amount
    # end
end
