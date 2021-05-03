class ReadingListsController < FullAccessController
  def show
    @books = current_user.favorite_books.includes(:chapters)
  end

  def require_full_access!
    if !current_user.has_full_access
      redirect_to me_path, alert: 'Please upgrade to full membership to save books to your reading list.'
    end
  end
end
