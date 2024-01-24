class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
    # app/models/user.rb
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "id", "id_value", "name", "password", "role", "updated_at"]
      end

    def self.ransackable_associations(auth_object = nil)
        ["doctor"]
      end
    enum role: { patient: 0, doctor: 1 }
    has_one :doctor
end
