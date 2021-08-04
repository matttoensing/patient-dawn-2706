class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def self.average_age_of_players
    Team.joins(:players).select('teams.*, ROUND(AVG(players.age)) AS avg_age').group('teams.id').order(Arel.sql('AVG(players.age) DESC'))
  end
end
