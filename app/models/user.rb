# app/models/user.rb
class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    enum role: { doctor: 'doctor', patient: 'patient' }
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
      end
  
    # Your other model configurations...
    def self.ransackable_associations(auth_object = nil)
        ["image_attachment", "image_blob"]
      end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
    end

  end
  