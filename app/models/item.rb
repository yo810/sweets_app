class Item < ApplicationRecord

  validates :name, :price, presence: true
  validates :introduction, length: {maximum: 200}
  validates :price, numericality: { only_integer: true }

  has_one_attached :image

  has_many :cart_items, dependent: :destroy

  # def image(width, height)
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no.image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image.variant(resize_to_limit: [width, height]).processed
  # end

end
