class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  protect_from_forgery

  def new
    @book = Book.new
    @user = current_user
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id), notice: "You have created book successfully."
  end

  def index
    @book = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books' # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
    if @book.update(book_params)
     redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
     flash.now[:danger] = "error"
     @books = Book.all
     render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end