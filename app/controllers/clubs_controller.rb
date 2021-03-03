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

  def edit
    @club = Club.find(params[:id])
    @book = @club.book
  end

  def update
    @club = Club.find(params[:id])

    if @club.update(update_club_params)
      redirect_to @club, notice: 'Bookclub updated.'
    else
      @book = @club.book
      render :edit
    end
  end

  def show
    @club = Club.find(params[:id])

    if !current_user.clubs.include?(@club)
      redirect_to me_path
    end

    @book = @club.book
    @scheduled_chapter_emails =
      @club.scheduled_club_emails.includes(:chapter).order(position: :asc)
    @organizer = @club.organizer
    @users = @club.users
  end

  def index
    @q = params[:q]
    @club = Club.find_by(
      passcode: @q,
      status: [Club::STATUSES[:enrolling], Club::STATUSES[:active]]
    )
  end

  private

  def create_club_params
    params
      .require(:club)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
      .merge(book_id: params[:book_id], organizer_id: current_user.id, status: 'enrolling')
  end

  def update_club_params
    params
      .require(:club)
      .permit(:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
  end
end
