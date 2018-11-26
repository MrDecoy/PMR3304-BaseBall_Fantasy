class Stadium < ApplicationRecord
  has_many :game
  belongs_to :team
end
