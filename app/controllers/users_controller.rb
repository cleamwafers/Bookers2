class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def index
  end
  
  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,)
  end
end
