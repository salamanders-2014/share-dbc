class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :user, index: true
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
