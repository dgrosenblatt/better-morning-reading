class FavoritesController < AuthenticatedController
  def index
    book_ids = UserFavoriteBook.where(user_id: current_user.id).pluck(:book_id)

    @query = params[:query]
    search_term = params[:query]&.downcase

    if search_term.present?
      @books = Book.where('LOWER(name) ilike ?', "%#{search_term}%")
        .or(Book.where('LOWER(author) ilike ?', "%#{search_term}%"))
        .where(id: book_ids)
        .includes(:chapters)
        .limit(200)
    else
      @books = Book.where(id: book_ids).includes(:chapters).limit(200)
    end

    # don't do this, just make a new view
    render 'books/index'
  end
end
