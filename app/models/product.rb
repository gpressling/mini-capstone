class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true 
  validates :price, presence: true
  validates :price, presence: true 
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  def images
    Image.where(product_id: id)
  end
  def supplier
    Supplier.find_by(id: supplier_id)
  end
  def is_discounted
    price <= 2
  end
  def tax
    price * 0.09
  end
  def total
    price + tax
  end
  def as_json
    {
      id: id,
      name: name,
      price: price,
      description: description,
      created_at: created_at,
      is_discounted: is_discounted,
      tax: tax,
      total: total,
      supplier: supplier.as_json,
      images: images
    }
  end
end
