class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :voter, index: true
      t.belongs_to :resource, index: true
      t.integer :value

      t.timestamps
    end
  end
end
