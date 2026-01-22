class AuthorsController < ApplicationController
  def index
    @my_author = Author.all
  end

  def show
    @my_author = Author.find(params[:id])
  end

  def edit
    @my_author=Author.find(params[:id])
  end

  def update
    @my_author=Author.find(params[:id])
    if @my_author.update(author_params)
      redirect_to @my_author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @my_author =Author.new
  end

  def create
    @my_author=Author.new(author_params)
    if @my_author.save
      redirect_to @my_author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @my_author=Author.find(params[:id])
    @my_author.destroy
    redirect_to authors_path, status: :see_other
  end

  private
  def author_params
    params.require(:author).permit(:name, :dob, book_ids: [])
  end
end
