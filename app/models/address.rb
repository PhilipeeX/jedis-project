class Address < ApplicationRecord
  belongs_to :municipe
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/ }
  validates :cep, :street, :neighborhood, :city, :state, presence: true
end
