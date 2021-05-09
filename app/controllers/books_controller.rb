class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(params[:id])
    if book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(book.id)
    else
      flash.now[:danger] = "Book was not successfully created"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
