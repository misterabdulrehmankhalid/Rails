class BooksController < ApplicationController
  def index
    @my_book = Book.all
  end

  def show
    @my_book = Book.find(params[:id])
  end

  def edit
    @my_book = Book.find(params[:id])
  end

  def update
    @my_book = Book.find(params[:id])
    if @my_book.update(book_params)
      redirect_to @my_book
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def new
    @my_book = Book.new
  end


  def create
    @my_book = Book.new(book_params)
    if @my_book.save
      redirect_to @my_book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @my_book = Book.find(params[:id])
    @my_book.destroy
    redirect_to books_path, status: :see_other
  end
  private

  def book_params
    params.require(:book).permit(:title, :description, author_ids: [])
  end
end
