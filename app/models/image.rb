class Image < ApplicationRecord

  # validates :product_id, presence:true

  # Association method
  belongs_to :product
end
