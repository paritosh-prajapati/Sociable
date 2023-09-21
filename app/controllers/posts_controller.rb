class PostsController < ApplicationController

	def index
		@user= User.find_by(id: current_user.id)
		@posts= @user.posts.all
	end

	def new    
		@post= Post.new
	end

	def create
		# debugger
		@user= User.find_by(id: current_user.id)
		@post= @user.posts.create(post_params)
		if @post.save
				redirect_to @post
			else
				render :new, status: :unprocessable_entity
		end
	end


	def show
		@post= Post.find(params[:id])
		# debugger
		# @post.post_file.attach(params[:image])
	end
	
	def edit    
		@post= Post.find(params[:id])
	end

	def update
		@post= Post.find(params[:id])
		if @post.update(post_params)
				redirect_to @post
			else
				render :edit
		end
	end

	def destroy
		@post= Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end
	
	private
	def post_params
		params.require(:post).permit(:body, :post_file)
	end

end
