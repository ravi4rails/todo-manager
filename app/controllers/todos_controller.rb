class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :mark_as_done]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:sort]

  def index
    @todos = current_user.todos.order('priority ASC')
  end

  def show;end

  def new
    @todo = Todo.new
  end

  def edit;end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:todo].each_with_index do |id, index|
      current_user.todos.where(id: id).update_all(priority: index + 1)
    end
    head :ok
  end

  def mark_as_done
    @todo.update(status: 'done')
    respond_to do |format|
      format.js
    end
  end

  private
    def set_todo
      @todo = Todo.friendly.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit!
    end
end
