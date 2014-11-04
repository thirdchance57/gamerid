class GamertagsController < ApplicationController

	# before_action is a rails tool to run
	# before_action :force_login

	# this means if -- before the :index is ran make sure to force_admin
	# before_action :force_admin, only: [index:] 



	def index
		@gamertags = Gamertag.all
	end

	def show
		@gamertag = Gamertag.find(params[:id])
	end

	def new
		@gamertag = Gamertag.new
	end

	def create

    @current_user  = current_user#User.where(:'username' => :username);

    @current_user.gamertags << Gamertag.new(params.require(:gamertag).permit(:platform, :server, :game, :name, :username))
#gamertags = Gamertag.new(params.require(:gamertag).permit(:platform, :server, :game, :name, :username, :user_id))
    if current_user.save
        redirect_to gamertags_path
    else
       render 'new'
    end
	end

	def edit
		@gamertag = Gamertag.find(params[:id])
	end

	def update
    @gamertags = Gamertag.find(params[:id])
    if @gamertags.update_attributes(params.require(:gamertag).permit(:platform, :server, :game, :name, :username))
        redirect_to gamertags_path
    else
        render 'edit'
    end
  end

  def destroy
  	@gamertag = Gamertag.find(params[:id])
    @gamertag.destroy
    redirect_to gamertags_path
  end

# admin destroy tool
    # def destroy
    # 	u = User.where(id:params[:id]).first
    # 	if u === current_user
    # 		reset_session
    # 	end
    # 	u.destroy
    # 	redirect_to users_path
    # end

# to make sure the user is logged in 
    # def force_login
    # 	if !current_user
    # 		redirect_to new_sessions_path
    # 	end
    # end


# to make sure the admin is logged in
	# private
	# 	def force_admin
	# 		if !current_user || !current_user.is_admin
	# 			redirect_to users_path
	# 		end
	# 	end
	# end
end