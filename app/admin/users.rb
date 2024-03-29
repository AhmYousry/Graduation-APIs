ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end
end