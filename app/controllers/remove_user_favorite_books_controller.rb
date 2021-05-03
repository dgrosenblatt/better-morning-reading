class RemoveUserFavoriteBooksController < FullAccessController
  def destroy
    user_favorite_book = UserFavoriteBook.find_by(
      book_id: params[:id], user_id: current_user.id
    )

    if user_favorite_book && user_favorite_book.destroy
      redirect_to reading_list_path, notice: 'Book removed from your reading list.'
    else
      redirect_to reading_list_path, notice: 'Book could not be removed from your reading list.'
    end
  end
end
