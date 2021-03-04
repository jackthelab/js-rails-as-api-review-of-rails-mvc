class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        # render json: sightings, include: [:bird, :location], except: [:created_at, :updated_at]
        render json: sightings.to_json(:include => {
            :bird => {:only => [:id, :name, :species]},
            :location => {:except => [:created_at, :updated_at]},
        }, :only => [:id])
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting, except: [:created_at, :updated_at]
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

        if sighting
            # render json: sighting, include: [:bird, :location], except: [:created_at, :updated_at]
            render json: sighting.to_json(:include => {
                :bird => { only: [:id, :name, :species] },
                :location => { except: [:created_at, :updated_at] }
            }, only: [:id])
        else
            render json: { message: "We can't find this bird. Make sure you've used a valid identifier" }
        end

    end

end
