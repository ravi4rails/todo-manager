module ApplicationHelper

  def flash_class(level)
    case level
      when :success then "alert alert-success"
      when :notice then "alert alert-success"
      when :alert then "alert alert-danger"
      when :error then "alert alert-error"
      when :warning then "alert alert-warning"
    end
  end

  def todo_type_list
    TodoType.all.map {|tt| [tt.name, tt.id]}
  end

end
