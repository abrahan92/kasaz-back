# frozen_string_literal: true

class PropertySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :sqm, :price, :bedrooms, :bathrooms
end
