class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items
  has_many :order_details

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
