class AddImageToPendings < ActiveRecord::Migration[7.1]
  def change
    add_column :pendings, :image, :json
  end
end
