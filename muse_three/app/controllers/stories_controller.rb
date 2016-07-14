class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def destroy
		@story.destroy
		redirect_to root_path
	end

	def index	
		@stories = Story.all	
	end

	def show
	end


	def new
		@story = current_user.stories.build
	end

	def create
		@story = current_user.stories.build(story_params)
		if @story.save
			redirect_to @story, notice: "Sucessfully created Story"
		else 
			render 'new'
		end
	end

def edit
	
end

def update
	if @story.update(story_params)
		redirect_to @story, notice: "Updated"
	else
		render 'edit'
	end	
end

private

def story_params
	params.require(:story).permit(:title, :description, :image)
end

def find_story
	@story = Story.find(params[:id])
end

end
