class Municipe < ApplicationRecord
  enum status: { active: 0, inactive: 1 }
  has_one_attached :photo

  validates :cpf, cpf: true

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone_number, :photo, :status, presence: true
end
