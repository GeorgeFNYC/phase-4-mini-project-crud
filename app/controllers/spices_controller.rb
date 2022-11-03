class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        new_spice = Spice.create(title: params[:title], image: params[:image], description: params[:description], notes: params[:notes], rating: params[:rating])
        render json: new_spice, status: :created
    end

    def update
        update_spice = Spice.find_by(id: params[:id])
        if update_spice
            update_spice.update(spice_param)
            render json: update_spice
        else
            render json: {error: "Spice doesn't exist"}
        end
    end

    def destroy
        delete = Spice.find_by(id: params[:id]).destroy
        render json: delete, status: :ok
    end

    private

    def spice_param
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
