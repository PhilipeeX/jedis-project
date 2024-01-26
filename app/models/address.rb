class Address < ApplicationRecord
  belongs_to :municipe
  validates :cep, correios_cep: true
  validates :cep, :street, :neighborhood, :city, :state, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[street state city]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[municipe]
  end
end
