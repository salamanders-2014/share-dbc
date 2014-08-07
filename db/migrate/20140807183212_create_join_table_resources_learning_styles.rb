class CreateLearningStyleResources < ActiveRecord::Migration
  def change
    create_table :learning_styles_resources do |t|
      t.belongs_to :resources, index: true
      t.belongs_to :learning_styles

      t.timestamp
    end
  end
end
