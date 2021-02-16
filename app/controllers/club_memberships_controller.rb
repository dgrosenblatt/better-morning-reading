class ClubMembershipsController < AuthenticatedController
  def create
    club = Club.find(params[:club_id])
    @club_membership = club.add_member(user: current_user, passcode: params[:passcode])

    if @club_membership
      redirect_to club, notice: 'You have successfully joined the bookclub.'
    else
      # maybe render again with error msgs
      redirect_to clubs_path, notice: 'Error joining the bookclub.'
    end
  end
end
