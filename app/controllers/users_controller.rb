class UsersController < ApplicationController
  def new
  	@user = User.new
  	#print "abccccc!!!!!!!!"
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	
  	@user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  	
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user

  	else
  		render 'new'
  	end

  end
  
end
