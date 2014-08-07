class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :voter, index: true
      t.belongs_to :resource, index: true
      t.has_one :learning_style
      t.integer :value

      t.timestamps
    end
  end
end
