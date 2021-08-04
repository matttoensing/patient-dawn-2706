class CompetitionTeamsController < ApplicationController
  def create
    competition = Competition.find(params[:id])
    team = Team.find_by(nickname: params[:nickname])
    comp_team = CompetitionTeam.create(team: team, competition: competition)

    redirect_to "/competitions/#{competition.id}"
  end
end
