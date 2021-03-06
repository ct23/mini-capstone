class Product < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 100 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { in: 10...500 }
  # validates :image_url, format: { with: URI.regexp }


  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    # Assume 9% tax rate
    return (price * 0.09).round(2)
  end

  def total
    return ('%.2f' % (tax + price)).to_i
  end

  # Association method
  belongs_to :supplier

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # Association methods
  has_many :images
  has_many :carted_products
  # has_many :orders, through: :carted_products (don't need)
  has_many :product_categories

  has_many :categories, through: :product_categories

  # def categories
  #   product_categories.map { | product_category | product_category.category }
  # end

  def category_names
    categories.map { |category| category.name }
  end

end
