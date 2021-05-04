# frozen_string_literal: true

class Property < ApplicationRecord
  ##############
  ### Scopes ###
  ##############

  scope :of_title, ->(title) { where(title: title) }

  ###################
  ### Validations ###
  ###################

  validates_presence_of :title, :price, :sqm, :bedrooms, :bathrooms
end
