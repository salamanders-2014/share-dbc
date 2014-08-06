class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :cohort, :email, :username, :role, :password_digest
      t.timestamps
    end
  end
end
