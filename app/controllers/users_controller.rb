class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    respond_to do |format|
      format.html {
        if @user.save
          flash[:success] = "Welcome, thanks for registering!"
          redirect_to @user
        else 
          render 'new'
        end  
      }
  	  format.json {
        if @user.save
    		redirect_to :user_token => 'post', :action => 'create'
      	else 
      		render (:json => {:state => {:code => 1, :messages => @user.errors.full_messages} })
      	end
      }
    end
  end

  #use Strong Parameters to sanitize user input
  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  									 :password_confirmation)
  	end

end