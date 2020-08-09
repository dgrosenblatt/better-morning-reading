class BooksController < ApplicationController
  # Guest users can view collection of Books
  def index
    @query = params[:query]
    search_term = params[:query]&.downcase

    if search_term.present?
      @books = Book.where('LOWER(name) ilike ?', "%#{search_term}%")
        .or(Book.where('LOWER(author) ilike ?', "%#{search_term}%"))
        .order(order)
        .limit(200)
    else
      @books = Book.all.order(order).limit(200)
    end
  end

  private

  def order
    { name: :asc }
  end
end
