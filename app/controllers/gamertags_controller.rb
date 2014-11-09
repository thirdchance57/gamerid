class GamertagsController < ApplicationController

	# before_action is a rails tool to run
	# before_action :force_login

	# this means if -- before the :index is ran make sure to force_admin
	# before_action :force_admin, only: [index:] 



	def index

     #  start of possible search method
    if params[:gamertag]
      @gamertag = Gamertag.where(:'gamertag' => params[:gamertag]) 

      @back = 1
    else
      @gamertag =  Gamertag.all
      @back = nil
    end

    # start of platform filter
    my_gamertag_filter = params[:gamertagfilter]
    case my_gamertag_filter
    when "showall"
      @gamertags = Gamertag.all
    when "Xbox"
      @gamertags = Gamertag.where(:platform => "Xbox")
    when "Playstation"
      @gamertags = Gamertag.where(:platform => "Playstation")
    when "Steam / PC"
      @gamertags = Gamertag.where(:platform => "Steam / PC")
    when "IOS Game Center"
      @gamertags = Gamertag.where(:platform => "IOS Game Center")
    when "Android Play Games"
      @gamertags = Gamertag.where(:platform => "Android Play Games")
    else
		  @gamertags = Gamertag.all
    end

    @users = User.all
    @photos = Photo.all
	end

	def show
		@gamertag = Gamertag.find(params[:id])
	end

	def new
		@gamertag = Gamertag.new
	end

	def create

    @current_user = current_user 

    @current_user.gamertags << Gamertag.new(params.require(:gamertag).permit(:platform, :server, :game, :name, :username))
#gamertags = Gamertag.new(params.require(:gamertag).permit(:platform, :server, :game, :name, :username, :user_id))
    if current_user.save
        redirect_to user_path(current_user)
    else
       render 'new'
    end
	end

	def edit
		@gamertag = Gamertag.find(params[:id])
	end

	def update
    @gamertag = Gamertag.find(params[:id])
    if @gamertag.update_attributes(params.require(:gamertag).permit(:platform, :server, :game, :name, :username))
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

def filter 
  redirect_to gamertags_path([:gamertag] => params[:gamertag])
  # redirect_to gamertags_path(:gamertag => params[:gamertag])
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