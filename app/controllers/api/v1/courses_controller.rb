class Api::V1::CoursesController < ApplicationController 

	before_action :set_course, only: [:show, :update, :destroy]

	def index
		@courses = Course.all.order(:asc)
		# render json: @courses 
	end

	def new 
	end

	def create
		@course = Course.create(course_params)
		if @course 
			redirect_to @course 
			flash[:notice] = 'Course created successfully'
		else 
			flash[:notice] = 'some errors prohibited course from being created'
			render @course.errors.messages 
		end 
	end

	def show 
		@course
	end

	def edit 
	end

	def update 
		if @course.update(course_params)
			redirect_to @course 
			flash[:notice] = 'course updated'
		else 
			flash[:notice] = 'some errors prohibited course from updating'
			render @course.errors.messages 
		end 
	end 

	def destroy 
		@course.delete 
		head[:no_content]
		flash[:notice] = 'course deleted'
	end 

	private 
	def course_params 
		params.require(:course).permit(:title, :description)
	end

	def set_course 
		@course = Course.find(params[:id])
	end
end 