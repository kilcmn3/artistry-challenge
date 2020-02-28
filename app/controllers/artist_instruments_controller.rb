class ArtistInstrumentsController < ApplicationController
    def new
        @artist_instrument = ArtistInstrument.new
        @artists = Artist.all 
        @instruments = Instrument.all
    end

    def create
        @artist_instrument = ArtistInstrument.create(ac_params)
        # byebug
        redirect_to artist_path(@artist_instrument.artist_id)
    end

    private

    def ac_params
        params.require(:artist_instrument ).permit(:instrument_id, :artist_id)
    end
end
