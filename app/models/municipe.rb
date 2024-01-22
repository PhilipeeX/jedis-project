class Municipe < ApplicationRecord
  has_one :municipe, dependent: :destroy
  enum status: { active: 0, inactive: 1 }
  has_one_attached :photo

  validates :cpf, cpf: true
  validates :cns, cns: true
  validates :birth_date, birth_date: true
  validates :email, confirmation: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, confirmation: { case_sensitive: false }

  validates :full_name, :cpf, :cns, :email, :email_confirmation, :birth_date, :phone_number, :photo, :status,
            presence: true
end
