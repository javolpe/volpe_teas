require 'rails_helper'

RSpec.describe Pacakge, type: :model do
  describe 'validations' do 
    it { should validate_presence_of :bags }
  end

  describe 'relationships' do
    it {should belong_to :subscription}
    it {should belong_to :tea}
  end
end
