class Product < ApplicationRecord

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

end
