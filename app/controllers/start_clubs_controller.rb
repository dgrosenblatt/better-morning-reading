class StartClubsController < AuthenticatedController
  def update
    club = Club.find_by(id: params[:id], organizer_id: current_user.id)
    if club.status == Club::STATUSES[:enrolling]
      club.update(status: Club::STATUSES[:active])
    end

    redirect_to club_path(club), notice: 'Bookclub started!'
  end
end
