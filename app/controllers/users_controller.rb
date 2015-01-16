class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy

  def index
  	@users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])

  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash.now[:success] = "Welcome " +@user.name+" to the Ruby on Rails!"
  		redirect_to @user
  	else
  	render 'new'	
  	end
  end
  def edit
    @user = User.find(params[:id])
  end
def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	flash[:success] = "Profile updated"
     	redirect_to @user
      # Handle a successful update.
    else
      render 'edit'
    end
  end
   # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  # Confirms the correct user.
  #check ID user hien tai vs ID tren thanh tab co giong nhau k? neu khac thi chuyen ve trang home(User hien tai chi edit dc thong tin cua chinh ho) 
    def correct_user
      @user = User.find(params[:id])
     # redirect_to(root_url) unless @user == current_user
     redirect_to(root_url) unless current_user?(@user) #Su dung ham current_user trong session_helper
    end
    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
    end
     # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
