require 'rails_helper'

RSpec.describe Household, type: :model do
  describe 'validation' do
    subject { household.valid? }

    let!(:other_household) { create(:household, address: Faker::Lorem.characters(number: 5)) }
    let(:household) { build(:household) }

    context 'with valid inputs' do
      it 'can be saved' do
        is_expected.to eq true
      end
    end

    context 'name' do
      it 'is invalid without a head_first_name' do
        household.head_first_name = ''
        is_expected.to eq false
      end

      it 'is invalid without a head_last_name' do
        household.head_last_name = ''
        is_expected.to eq false
      end
    end

    context 'house_damage_situation' do
      it 'is invalid without a house_damage_situation' do
        household.house_damage_situation = ''
        is_expected.to eq false
      end
    end

    context 'living_space' do
      it 'is invalid without a living_space' do
        household.living_space = ''
        is_expected.to eq false
      end
    end

    context 'emial' do
      it 'is invalid without an email' do
        household.address = ''
        is_expected.to eq false
      end

      it 'is invalid with an email that already exists' do
        household.address = other_household.address
        is_expected.to eq false
      end
    end
  end

  describe 'instance' do
    let!(:household) { build(:household) }

    describe 'information' do
      it 'returns a conbined string of head_last_name, head_first_name and address' do
        expect(household.information).to eq "日本博　#{household.address}"
      end
    end

    describe 'full_name' do
      it 'returns a conbined string of head_last_name and head_first_name' do
        expect(household.full_name).to eq '日本 博'
      end
    end
  end

  describe 'association' do
    it 'has many residents' do
      expect(Household.reflect_on_association(:residents).macro).to eq :has_many
    end
  end
end