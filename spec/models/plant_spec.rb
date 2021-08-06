require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:assignments) }
    it { should have_many(:plots).through(:assignments)}
  end
end
