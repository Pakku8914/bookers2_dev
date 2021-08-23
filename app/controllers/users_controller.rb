class UsersController < ApplicationController
  def index
    @user_all = User.all
    @user_info = current_user
    @book = Book.new
  end

  def show
    @user_info = User.find(params[:id])
    @book = Book.new
    # user_infoに紐づけられたbooksを読み込む
    @my_books = @user_info.books
  end

  def edit
    @user_info = User.find(params[:id])
    # 一緒じゃなかったら
    # unless @user_info == current_user
    #   redirect_to user_path(current_user.id)
    # else
    #   render :edit
    # end
    if @user_info != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user_info = User.find(params[:id])
    if @user_info.update(user_params)
      redirect_to user_path(@user_info.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    @user_info = User.find(params[:id])
    @user_info.destroy
    redirect_to user_path(@user_info.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
