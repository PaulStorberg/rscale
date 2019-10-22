class PollOption < ApplicationRecord
  belongs_to :poll, optional: true
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :title,   presence: true

  def average_ratings
    vote_average = []

    self.votes.each do |vote|
      vote_average = vote_average.push(vote.rating.to_f)
    end

    vote_count    = vote_average.count
    vote_sum      = vote_average.sum
    sumed_average = (vote_sum/ vote_count)

    sumed_average.round(2)
  end
end
