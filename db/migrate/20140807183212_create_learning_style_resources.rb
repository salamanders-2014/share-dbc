class CreateLearningStyleResources < ActiveRecord::Migration
  def change
    create_table :learning_style_resources do |t|
      t.belongs_to :resource, index: true
      t.belongs_to :learning_style

      t.timestamp
    end
  end
end
