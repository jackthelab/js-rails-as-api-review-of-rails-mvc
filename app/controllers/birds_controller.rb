class BirdsController < ApplicationController

    def index
        birds = Bird.all
        # render json: { birds: birds, messages: ['Hello Birds', 'Goodbye Birds'] }

        # Below are two way to choose what keys to include on a mass level

        # only: is inclusive of selected keys
        # render json: birds, only: [:id, :name, :species]

        # except: excludes the selected keys
        render json: birds, except: [:created_at, :updated_at]

        # only: & except: are are params to to_json method
        ## fully written out without Rails magic would look somehting like...
        ## render json: birds.to_json(except: [:created_at, :updated_at])
    end

    def show
        bird = Bird.find_by(id: params[:id])

        #Below are ways to select specific keys to return for a single object

        # render json: { id: bird.id, name: bird.name, species: bird.species }
        # render json: bird.slice(:id, :name, :species)

        if bird
            render json: bird.slice(:id, :name, :species)
        else
            render json: { message: "Bird not found" }
        end
    end

end