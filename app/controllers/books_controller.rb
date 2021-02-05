class BooksController < ApplicationController
  def top
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def create
  	  @book = Book.new(book_params)
  	  if @book.save
  	  #保存実行
  	  redirect_to book_path(@book)
  	  flash[:notice] = "Book was successfully created."
     else
  	  #保存未実行
      @books = Book.all
  	  render :index
     end
  end


  def show
      @book = Book.find(params[:id])
  end

  def new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find_by(id: params[:id])
  	  if @book.update(book_params)
  	  #保存実行
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully updated."
    else
      #保存未実行
      @books = Book.all
      render :edit
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
   def  book_params
     params.require(:book).permit(:title, :body)
   end
end