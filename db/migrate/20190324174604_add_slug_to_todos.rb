class AddSlugToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :slug, :string
  end
end
