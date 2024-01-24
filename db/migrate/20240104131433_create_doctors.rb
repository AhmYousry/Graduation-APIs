class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :certificate
      t.boolean :approved

      t.timestamps
    end
  end
end
