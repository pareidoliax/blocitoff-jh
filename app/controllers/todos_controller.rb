class TodosController < ApplicationController

	before_action :authenticate_user!
	
	def new
		@todo = Todo.new
	end

	def create
		@todo = current_user.todos.new(todo_params)
		if @todo.save
			redirect_to todos_path, notice: 'Your new TODO was saved'
		else
			flash[:error] = 'Please fill in the todo description'
			redirect_to todos_path
		end
	end

	def show
		@todo = Todo.find params[:id]
	end

	def index
		  @todos = current_user.todos
	end

	def complete
		@todos = current_user.todos
		if params.has_key?(:todos_checkbox)
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)
				t.complete = true
				t.save
			end
			render 'index'
		else
			flash[:error] = 'Please select a todo'
			redirect_to todos_path 	
		end
	end

	private
 
   def todo_params
     params.require(:todo).permit(:description)
   end
end