class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
    	t.references :project, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.date :deadline
      t.string :sc
      t.integer :task_type, default: 0
      t.integer :status, default: 0
    end
  end
end
