class Address < ApplicationRecord
    belongs_to :end_user

    def view_postcode_and_address_and_name
        self.postcode + ' ' + self.street_address + ' '+ ' ' + self.ship_name + ' '
    end
end
