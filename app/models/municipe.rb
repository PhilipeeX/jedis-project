class Municipe < ApplicationRecord
  has_one_attached :photo

  enum status: { active: 0, inactive: 1 }
end
