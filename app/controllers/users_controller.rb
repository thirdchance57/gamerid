class UsersController < ApplicationController

	# before_action is a rails tool to run
	# before_action :force_login

	# this means if -- before the :index is ran make sure to force_admin
	# before_action :force_admin, only: [index:] 

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
    @gamertags = Gamertag.all
    @users = User.all
	end

	def new
		@user = User.new
		@is_signup = true
	end

	def create
	    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :password, :password_confirmation))
	    if @user.save
	    	session[:user_id] = @user.id.to_s
	        redirect_to user_path(current_user)
	    else
	        redirect_to new_user_path, notice: 'Invalid,  Check form and try again'
	    end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
      @user = User.find(params[:id])
      if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :password, :password_confirmation))
        redirect_to edit_user_path(@user), alert: 'Profile Updated'
      else
        redirect_to edit_user_path(@user), notice: 'Invalid,  Check form and try again'
      end
  end

# def destroy
# 	@user = User.find(params[:id])
#     @user.destroy
#     redirect_to users_path
# end

# admin destroy tool
  def destroy
  	u = User.where(id:params[:id]).first
  	if u === current_user
  		reset_session
  	end
  	u.destroy
  	redirect_to users_path
  end

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