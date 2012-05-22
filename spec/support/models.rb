
class Product
  attr_accessor :name, :id, :related_products

  def initialize
    self.related_products = []
  end

  def self.test_instance
    p = Product.new
    p.name = "test_name"
    p.id = "test_id"

    p2 = Product.new
    p2.name = "related_product_name"
    p2.id = "related_product_id"

    p.related_products << p2
    p
  end

  class Presenter < Rendition::Presenter
    def name_and_id
      "#{name}_#{id}"
    end
  end

  class AltPresenter < Product::Presenter
    def is_alt?
      true
    end
  end
end