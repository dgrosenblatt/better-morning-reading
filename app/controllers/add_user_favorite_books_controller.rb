class AddUserFavoriteBooksController < FullAccessController
  def create
    @user_favorite_book = UserFavoriteBook.new(
      user_id: current_user.id,
      book_id: params[:book_id],
    )

    respond_to do |format|
      if @user_favorite_book.save
        format.js
        format.json { render json: @user_favorite_book, status: :created }
      else
        format.json do
          render json: @user_favorite_book.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
