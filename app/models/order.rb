class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :cart
  belongs_to :user
end
