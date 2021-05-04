# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { described_class.new(title: 'First property', price: 25_000, sqm: 250, bedrooms: 2, bathrooms: 1) }

  it 'is valid with valid attributes' do
    expect(property).to be_valid
  end

  it 'is not valid without a title' do
    property.title = nil
    expect(property).not_to be_valid
  end

  context 'when the property is successfully' do
    it 'created' do
      expect(property.save).to be_truthy
    end

    it 'updated' do
      property.title = 'Updated title'
      expect(property.save).to be_truthy
    end

    it 'deleted' do
      expect(property.destroy).to be_truthy
    end
  end

  context 'when search' do
    let(:another_property) do
      described_class.new(title: 'Second property', price: 55_000, sqm: 500, bedrooms: 4, bathrooms: 3)
    end

    it 'just one property' do
      property.save
      expect(described_class.all.first).to be_an_instance_of(described_class)
    end

    it 'return many properties' do
      property.save
      another_property.save

      expect(described_class.all.count).to be > 1
    end
  end
end
