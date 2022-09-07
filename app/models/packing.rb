class Packing < ApplicationRecord
  belongs_to :profile
  validates :name, presence: true

  COLORS = {
    Darkorange: "#FD703F",
    Peach: "#F27877",
    Greenblue: "#4EB9B3",
    Darkblue: "#27357E",
    Yellow: "#FFA963"
  }
end
