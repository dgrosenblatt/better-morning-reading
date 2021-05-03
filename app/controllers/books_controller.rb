class BooksController < ApplicationController
  # Guest users can view collection of Books
  def index
    @query = params[:query]
    search_term = params[:query]&.downcase

    if search_term.present?
      @books = Book.where('LOWER(name) ilike ?', "%#{search_term}%")
        .or(Book.where('LOWER(author) ilike ?', "%#{search_term}%"))
        .includes(:chapters)
        .order(order)
        .limit(200)
    else
      @books = Book.all.includes(:chapters).order(order).limit(200)
    end

    @favorite_books_by_id = favorite_books_by_id
  end

  private

  def favorite_books_by_id
    favorite_books = {}
    if current_user
      favorites = current_user.favorite_books
      favorites.each do |book|
        favorite_books[book.id] = true
      end
    end

    favorite_books
  end

  def order
    { name: :asc }
  end
end
