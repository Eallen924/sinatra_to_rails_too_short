class UsersController < ApplicationController
  
  def create
    @user = User.new(params[:user])
    @user.password_confirmation = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      render 'show'
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    p params[:user]
    puts "*" * 80
    user = User.find(params[:id])
    @user = user.update_attributes(params[:user])
    flash[:success] = "Account Update Successful!"
    redirect_to root_path
  end

  def destroy
    User.find(params[:id]).destroy
    render 'index/index'
  end
end
