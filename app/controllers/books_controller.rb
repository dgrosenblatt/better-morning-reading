class BooksController < ApplicationController
  # Guest users can view collection of Books
  def index
    # TODO: add pagination
    @books = Book.all
  end
end
