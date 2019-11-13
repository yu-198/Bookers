class BooksController < ApplicationController
	def create
  	@book = Book.new(book_params)
    #もしbooの投稿が成功したら
  	if @book.save
     flash[:notice] = "Book was successfully created."
  	redirect_to book_path(@book.id)
    #バリデーションのエラーが出たら
    else
      #indexのデータを持ってくる
      @books = Book.all
      #バリデーションエラー時のviewファイルを持ってくる
      #エラーメッセージはmodelの中に入ってる
      render :index
      #最後にviewページでエラーメッセージを呼び出す
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
      @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
  	params.require(:book).permit(:title,:body)
end

end
