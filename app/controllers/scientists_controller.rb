class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 

    def index 
        scientists = Scientist.all
        render json: scientists
    end

    def show 
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistPlanetSerializer
    end

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: 201
    end

    def update 
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: 202
    end

    def destroy 
        scientist = Scientist.find(params[:id])
        scientist.destroy
        render status: 200
    end

    private 

    def render_not_found_response
        render json: { error: "Scientist not found"}, status: 404 
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: 422
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
