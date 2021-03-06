class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_products
  has_many :orders
  has_many :shippings
  
  def full_name
    self.last_name + self.first_name
  end

  def active_for_authentication?
    super && (self.delete_user == false)
  end

end
