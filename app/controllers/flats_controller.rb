class FlatsController < ApplicationController
    before_action :id_flat, only:  %i[ edit destroy ]

    def index 
        @flats = Flat.all
    end 

    def new 
        @flat = Flat.new
    end

    def create 
        @flat = Flat.new
        if  @flat.save
            redirect_to flats_path(@flat)
        else
            render :new
        end
    end

    def edit 
    end

    def  update 
        @flat.update(flat_params)
        redirect_to flat_path(@flat)
    end

    def destroy 
        @flat.destroy
        redirect_to flats_path
    end


    private 

    def flat_params 
        params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
    end

    def id_flat 
        @flat = Flat.find(params[:id])
    end
end
