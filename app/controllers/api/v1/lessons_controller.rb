class Api::V1::LessonsController < ApplicationController 
	before_action :set_lesson, only: [:show, :upadte, :destroy]

	def index 
		@section = Section.find(params[:section_id])
		@lessons = @section.lessons  
	end

	def create 
		@lesson = Lesson.create(lesson_params)
		if @lesson 
			redirect_to @lesson 
			flash[:notice] = 'lesson created successfully'
		else 
			render @lesson.errors.messages 
			flash[:notice] = 'some errors prohibited lesson from creating'
		end
	end

	def show 
	end 

	def edit 
	end 

	def update 
		if @lesson.update(lesson_params)
			redirect_to @lesson 
			flash[:notice] = 'lesson updated'
		else 
			render @lesson.errors.messages 
			flash[:notice] = 'some errors prohibited lesson from updating' 
		end 
	end 

	def destroy 
		@lesson.delete 
		head[:no_content]
		flash[:notice] = 'lesson deleted'
	end

	private 
	def lesson_params 
		params.require(:lesson).permit(:title, :description)
	end 

	def set_lesson 
		@lesson = Lesson.find(params[:id])
	end
end