class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      # t.references :project, null: false, foreign_key: true
      
    end
  end
end
