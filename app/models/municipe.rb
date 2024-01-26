class Municipe < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  enum status: { active: 0, inactive: 1 }
  has_one_attached :photo

  validates :cpf, cpf: true
  validates :cns, cns: true
  validates :birth_date, birth_date: true
  validates :email, confirmation: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, confirmation: { case_sensitive: false }
  validates :phone_number, phone: true

  validates :full_name, :cpf, :cns, :email, :email_confirmation, :birth_date, :phone_number, :photo, :status,
            presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[full_name cpf cns email phone_number]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[address]
  end
end
