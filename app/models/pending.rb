class Pending < ApplicationRecord
  validates :name, presence: true
  validates :role, presence: true
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
  
end
