require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:assignments)}
    it { should have_many(:plants).through(:assignments)}
  end
end
