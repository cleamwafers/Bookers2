class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user,only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if  @user == current_user
      render "edit"
    else
      redirect_to user_path
    end
  end

  def index
    @user = current_user
    @users = User.all
    @books = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
    flash.now[:danger] = "error"
    render :edit
    end
  end

  private

  def baria_user
    @user = params[:id]
    if params[:id].to_i !=current_user.id
    redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
