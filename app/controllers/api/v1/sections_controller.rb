class Api::V1::SectionsController < ApplicationController 
	
	before_action :set_section, only: [:show, :update, :destroy]

	def index
		@course = Course.find(params[:course_id])
		@sections = @course.sections
	end

	def new 
	end 

	def create 
		@section = Section.create(section_params)
		if @section 
			redirect_to @section 
			flash[:notice] = 'section created successfully'
		else 
			render @section.errors.messages 
			flash[:notice] = 'some errors prohibited section from created'
		end 
	end

	def show 
	end 

	def edit 
	end 

	def update 
		if @section.update(section_params)
			redirect_to @section 
				flash[:notice] = 'section updated'
		else 
			render @ection.errors.messages 
			flash[:notice] = 'some errors prohibited section from updating'
		end 
	end 

	def destroy 
		@section.delete 
		head[:no_content]
		flash[:notice] = 'section deleted'
	end

	private 
	def section_params 
		params.require(:section).permit(:title, :description)
	end

	def set_section 
		@section = Section.find(params[:id])
	end
end