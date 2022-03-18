class AnimesController < ApplicationController
  before_action :set_anime, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]

  # GET /animes or /animes.json
  def index
    @animes = Anime.all
  end

  # GET /animes/1 or /animes/1.json
  def show
  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  def follow
    anime = Anime.find(params[:id])
    current_user.followed << anime
    redirect_back(notice: "You followed #{anime.name}", fallback_location: root_path)
  end

  def unfollow
    anime = Anime.find(params[:id])
    current_user.followed.delete(anime)
    redirect_back(notice: "Unfollowd #{anime.name}", fallback_location: root_path)
  end

  def favorite
    anime = Anime.find(params[:id])
    anime = current_user.follow_animes.find_by(anime_id: anime.id)
    anime.favorite = true
    anime.save
    redirect_back(notice: "You successfully favorited!", fallback_location: root_path)
  end

  def unfavorite
    anime = Anime.find(params[:id])
    anime = current_user.follow_animes.find_by(anime_id: anime.id)
    anime.favorite = false
    anime.save
    redirect_back(notice: "You successfully unfavorited!", fallback_location: root_path)
  end

  def follow_and_favorite
    anime = Anime.find(params[:id])
    current_user.followed << anime
    animefollowed = current_user.follow_animes.find_by(anime_id: anime.id)
    animefollowed.favorite = true
    animefollowed.save
    redirect_back(notice: "You successfully favorited!", fallback_location: root_path)
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes or /animes.json
  def create
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to anime_url(@anime), notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1 or /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to anime_url(@anime), notice: "Anime was successfully updated." }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1 or /animes/1.json
  def destroy
    @anime.destroy

    respond_to do |format|
      format.html { redirect_to animes_url, notice: "Anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_params
      params.require(:anime).permit(:name, :gender, :classification)
    end
end
