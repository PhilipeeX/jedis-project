require 'rails_helper'

RSpec.describe Municipe, type: :model do
  it { should define_enum_for(:status).with_values(active: 0, inactive: 1) }
end
