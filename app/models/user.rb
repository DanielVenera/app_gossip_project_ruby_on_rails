class User < ApplicationRecord
    validates :email,
    uniqueness: true, 
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "can't be blank" }
    validates :first_name,
    presence: true,  
    length: { maximum: 20 }
    validates :last_name,
    presence: true,
    length: { maximum: 50 }
    validates :age, 
    presence: true,
    length: { maximum: 4 }
    belongs_to :city
    validates :city,
    presence: true,
    length: { minimum: 2 }
    has_many :gossips
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    has_secure_password
    has_many :likes, dependent: :destroy
end