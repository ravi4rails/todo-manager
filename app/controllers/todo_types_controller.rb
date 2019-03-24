class TodoTypesController < ApplicationController
  before_action :set_todo_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @todo_types = TodoType.all
  end

  def show;end

  def new
    @todo_type = TodoType.new
  end

  def edit;end

  def create
    @todo_type = TodoType.new(todo_type_params)

    respond_to do |format|
      if @todo_type.save
        format.html { redirect_to @todo_type, notice: 'Todo type was successfully created.' }
        format.json { render :show, status: :created, location: @todo_type }
      else
        format.html { render :new }
        format.json { render json: @todo_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_type.update(todo_type_params)
        format.html { redirect_to @todo_type, notice: 'Todo type was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_type }
      else
        format.html { render :edit }
        format.json { render json: @todo_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_type.destroy
    respond_to do |format|
      format.html { redirect_to todo_types_url, notice: 'Todo type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_type
      @todo_type = TodoType.find(params[:id])
    end

    def todo_type_params
      params.require(:todo_type).permit(:name)
    end
end
