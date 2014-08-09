class CreateSubjectResources < ActiveRecord::Migration
  def change
    create_table :subject_resources, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :resource, index: true

      t.timestamps
    end
  end
end
