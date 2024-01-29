# app/admin/user.rb
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :image

  show do
    attributes_table do
      row :email
      row :role
      row :image do |user|
        image_tag user.image if user.image.attached?
      end
    end
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: User.roles.keys
      f.input :image, as: :file
    end
    f.actions
  end
end
