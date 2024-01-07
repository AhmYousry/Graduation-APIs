ActiveAdmin.register Pending do
  menu label: 'Pending Doctors'

  permit_params :name, :email, :password, :password_confirmation, :role, :image

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :image
    actions do |pending|
      link_to 'View', admin_pending_path(pending)
      link_to 'Edit', edit_admin_pending_path(pending)
      link_to 'Delete', admin_pending_path(pending), method: :delete, data: { confirm: 'Are you sure?' }
      link_to 'Reject', reject_admin_pending_path(pending), method: :put
      link_to 'Accept', accept_admin_pending_path(pending), method: :put
    end
  end

  show do
    attributes_table do
      row :name
      row :email
      row :role
      row :image do |pending|
        image_tag pending.image if pending.image.attached?
      end
    end
  end

  form do |f|
    f.inputs 'Pending Doctor Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :image, as: :file
    end
    f.actions
  end

  member_action :accept, method: :put do
    @pending = Pending.find(params[:id])
    user_params = @pending.attributes.slice('name', 'email', 'password', 'password_confirmation', 'role', 'image')
    user_params['role'] = 'doctor'
    user = User.new(user_params)
    if user.save
      @pending.destroy
      redirect_to admin_pendings_path, notice: 'Doctor accepted and moved to User table.'
    else
      redirect_to admin_pendings_path, alert: 'Error accepting doctor.'
    end
  end

  member_action :reject, method: :put do
    @pending = Pending.find(params[:id])
    @pending.destroy
    redirect_to admin_pendings_path, notice: 'Doctor rejected and removed from Pending table.'
  end
end
