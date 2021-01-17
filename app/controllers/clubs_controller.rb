class ClubsController < AuthenticatedController
  def new
    @book = Book.find(params[:book_id])
    @club = Club.new(book_id: params[:book_id])
  end

  def create
    @club = Club.new(create_club_params)

    if @club.save
      redirect_to @club, notice: 'Bookclub created.'
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def show
    @club = Club.find(params[:id])
    @book = @club.book
    @scheduled_chapter_emails =
      @club.scheduled_club_emails.includes(:chapter).order(position: :asc)
    @organizer = @club.organizer
    @users = @club.users
  end

  private

  def create_club_params
    params
      .require(:club)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
      .merge(book_id: params[:book_id], organizer_id: current_user.id, status: 'enrolling')
  end
end
