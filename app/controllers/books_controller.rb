class BooksController < ApplicationController

before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
    @users=User.all
  end

  def show
  	@book=Book.find(params[:id])
    # @user=@book.user
    @books=Book.new
    @user=User.find(@book.user_id)
  end

  def create
  	#ストロングパラメータを使用
  	@book=Book.new(book_params)
  	# DBへ保存する
  	#トップ画面へリダイレクト
    @book.user_id = current_user.id
  	if @book.save
      flash[:notice]= "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
  end
  end

  def destroy
  	book=Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  def edit
  	@book=Book.find(params[:id])
    if @book.user_id != current_user.id

      redirect_to books_path
    end
  end

  def update
  	@book=Book.find(params[:id])
    if @book.update(book_params)
    	redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit, notice: "error"
    end
  end

private
def book_params
	params.require(:book).permit(:title, :body, :user_id)
end
end
