class Address < ApplicationRecord
  belongs_to :municipe
  validates :cep, correios_cep: true
  validates :cep, :street, :neighborhood, :city, :state, presence: true
end
