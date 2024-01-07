class User < ApplicationRecord
  validates :name, presence: true
  validates :role, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable


end
