class SongsController < ApplicationController
  before_action :set_song, only: :show

  def index
    @songs = Song.all
  end

  def show; end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
