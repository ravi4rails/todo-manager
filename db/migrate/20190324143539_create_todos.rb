class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.date :due_date
      t.string :status
      t.integer :priority
      t.references :todo_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
