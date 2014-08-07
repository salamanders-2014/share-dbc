class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.belongs_to :creator, index: true
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
