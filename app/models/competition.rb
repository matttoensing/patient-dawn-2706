class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def average_player_age
    self.teams.joins(:players).average(:age).to_i
  end
end
