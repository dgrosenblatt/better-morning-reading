class ClubMembershipsController < AuthenticatedController
  def create
    club = Club.find(params[:club_id])

    if club.add_member(user: current_user, passcode: params[:passcode])
      redirect_to club, notice: 'You have successfully joined the bookclub.'
    else
      @q = params[:passcode]
      redirect_to clubs_path, notice: 'Error joining the bookclub.'
    end
  end
end
