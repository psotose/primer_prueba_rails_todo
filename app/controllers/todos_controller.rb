class TodosController < ApplicationController 
before_action :set_params, only: [:show, :edit, :update, :destroy, :complete]
    def index
        @todos = Todo.all

    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            redirect_to root_path
        end
    end 

    def show
    end

    def edit
    end

    def update
        @todo.update(todo_params)
        if @todo.save
        redirect_to root_path
        end
    end 

    def destroy
        @todo.destroy
        redirect_to root_path
    end

    def complete
        @todo.completed =! @todo.completed
        @todo.save
        redirect_to root_path
    end 

    def list
        @todo_completed = Todo.where(completed: true)
        @todo_uncompleted = Todo.where(completed: false)
    end

    private

    def todo_params
        params.require(:todo).permit(:completed, :description)
    end

    def set_params
        @todo = Todo.find(params[:id])
    end

end
