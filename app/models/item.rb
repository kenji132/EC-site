class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    has_many :cart_items
    attachment :image
    validates :without_tax, numericality: true

    def self.search(search)
        if search
          where('name LIKE(?)', "%#{search}%")
        else
          all
        end
    end
end
