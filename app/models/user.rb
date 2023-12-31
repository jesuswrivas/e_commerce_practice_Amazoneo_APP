class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :purchases, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_one :cart, dependent: :destroy



    
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    enum role: [:user, :admin]
  
    has_secure_password

    
    def get_all_purchase_products
        new_table = PurchaseProduct.joins(:purchase).select('purchase_products.*, purchases.user_id').where('purchases.user_id = ?', self.id)
        new_table
    end

end


