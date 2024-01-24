ActiveAdmin.register Doctor do
  permit_params :user_id, :certificate, :approved

  form do |f|
    f.inputs "Doctor Details" do
      f.input :user
      f.input :certificate, as: :file
      f.input :approved
    end
    f.actions
  end
end