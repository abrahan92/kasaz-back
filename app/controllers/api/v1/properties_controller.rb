# frozen_string_literal: true

module Api
  module V1
    # Property class controller
    class PropertiesController < Api::V1::BaseController
      # GET /api/v1/properties/
      def index
        page = params[:page].blank? ? 1 : params[:page].to_i

        render json: PropertySerializer.new(Property.page(page)).serialized_json
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

      # GET /api/v1/filters/
      def filters
        filters = Hash.new
        filters[:page_count] = Property.all.page(3).total_pages
        filters[:rooms] = nil
        filters[:max_price] = nil
        filters[:min_price] = nil
        filters[:max_size] = nil
        filters[:min_size] = nil
        filters[:prices] = Property.all.order(price: :asc).map do |property|
          {
            key: property.id,
            value: property.price,
            text: "#{property.price} €"
          }
        end
        filters[:sizes] = Property.all.order(sqm: :asc).map do |property|
          {
            key: property.id,
            value: property.sqm,
            text: "#{property.sqm} mts2"
          }
        end

        render json: { success: true, data: filters }
      end

      private

      def property_params
        params.permit(:title, :sqm, :price, :bedrooms, :bathrooms, :avatar)
      end
    end
  end
end
