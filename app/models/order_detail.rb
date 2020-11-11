class OrderDetail < ApplicationRecord
    enum produce_status: { cannot_start: 0,  waiting: 1, producing: 2, complete: 3 }, _prefix: :from
    belongs_to :order
    belongs_to :item

    def subtotal
        tax_price*amount
    end
end
