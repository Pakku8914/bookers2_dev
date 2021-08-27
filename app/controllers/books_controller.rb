class BooksController < ApplicationController
    def index
        @book_new = Book.new
        @books = Book.all
        @user_info = current_user
    end

    def create
        @user_info = current_user
        @books = Book.all
        @book_new = Book.new(book_params)
        @book_new.user_id = current_user.id
        if @book_new.save
            redirect_to book_path(@book_new.id), notice: "You have created user successfully."
        else
            render :index
        end
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user != current_user
            redirect_to books_path
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id), notice: "You have updated user successfully."
        else
            render :edit
        end
    end

    def show
        @book = Book.new
        @comment = BookComment.new
        @book_detail = Book.find(params[:id])
        @user_info = @book_detail.user  # User.find(@book_detail.user_id)
        # @user = User.find(@book_detail.user_id)
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end


    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
