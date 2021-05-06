# frozen_string_literal: true

class Property < ApplicationRecord
  attr_accessor :picture
  
  ################
  ### Includes ###
  ################
  include Rails.application.routes.url_helpers

  #################
  ### Relations ###
  ################# 

  has_one_attached :avatar

  ##############
  ### Scopes ###
  ##############

  scope :of_title, ->(title) { where(title: title) }

  ###################
  ### Validations ###
  ###################

  validates_presence_of :title, :price, :sqm, :bedrooms, :bathrooms, :avatar

  ########################
  ### Instance methods ###
  ########################

  def picture
    url_for(self.avatar)
  end
end
