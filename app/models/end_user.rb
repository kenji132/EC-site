class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :cart_items
  has_many :addresses
  has_many :orders
  
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :phone_number, presence: true
  validates :street_address, presence: true

  def active_for_authentication?
    super && (self.is_signed == false)
  end
  def full_name
    self.last_name + self.first_name
  end
end
