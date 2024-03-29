class Doctor < ApplicationRecord
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["approved", "certificate", "created_at", "id", "id_value", "updated_at", "user_id"]
  end

end
