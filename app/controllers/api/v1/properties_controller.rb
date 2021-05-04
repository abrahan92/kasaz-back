# frozen_string_literal: true

module Api
  module V1
    # Property class controller
    class PropertiesController < Api::V1::BaseController
      # GET /api/v1/properties/
      def index
        render json: PropertySerializer.new(Property.all).serialized_json
      end

      # GET /api/v1/properties/:id
      def show
        render json: PropertySerializer.new(Property.find(params[:id])).serialized_json
      end

      # POST /api/v1/properties/
      def create
        @property = Property.new(property_params)
        if @property.save
          render json: PropertySerializer.new(@property).serialized_json
        else
          render json: { success: false, error: 'Error' }
        end
      end

      # PUT /api/v1/properties/:id/
      def update
        @property = Property.find(params[:id])

        if @property.update(property_params)
          render json: PropertySerializer.new(@property).serialized_json
        else
          render json: { success: false, error: 'Error' }
        end
      end

      # DELETE /api/v1/properties/:id/
      def destroy
        @property = Property.find(params[:id])

        if @property.destroy
          render json: { success: true, msg: 'Deleted' }
        else
          render json: { success: false, error: 'Error' }
        end
      end

      private

      def property_params
        params.require(:property).permit(:title, :sqm, :price, :bedrooms, :bathrooms)
      end
    end
  end
end
