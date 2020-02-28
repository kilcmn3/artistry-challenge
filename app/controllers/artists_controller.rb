class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new
        @instruments = Instrument.all
        @error = flash[:error]
    end

    def create
        @artist = Artist.create(artist_params)
        @artist.instruments << Instrument.find(params[:artist][:instrument_id].to_i)
        
        if @artist.valid?
        redirect_to artist_path(@artist)
        else
            flash[:error] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :age, :title)
    end
end
