class FavoritesController < ApplicationController
  def create
    # favorite = current_user.favorites.new(book_id: params[:id],user_id: current_user.id)
    favorite = current_user.favorites.new(book_id: params[:book_id], user_id: current_user.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
