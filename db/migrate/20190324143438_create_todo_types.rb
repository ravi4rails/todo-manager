class CreateTodoTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
