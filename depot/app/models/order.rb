class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ I18n.t('.check'), I18n.t('.credit'), I18n.t('.purchase') ]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end

