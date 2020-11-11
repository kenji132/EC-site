class Order < ApplicationRecord
    enum payment_method: { credit: 1,  bank: 2 }, _prefix: :true
    enum order_status: { waiting: 0,confirm: 1,producing: 2,preparing: 3,shipping: 4}, _prefix: :true
    belongs_to :end_user
    has_many :order_details
    def view_postcode_and_address_and_name
        self.postcode + ' ' + self.street_address + ' '+ ' ' + self.name + ' '
    end
    def view_postcode_and_address_and_name2
        '〒'+self.postcode + ' ' + self.street_address + ' '+ ' ' + self.name + ' '
    end

    def order_amount
        @sum = 0
        self.order_details.each do |f|
            @sum += f.amount
        end
    end

end
