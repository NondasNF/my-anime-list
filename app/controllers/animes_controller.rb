class AnimesController < ApplicationController
  before_action :set_anime, only: %i[ show edit update destroy ]

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
    type = params[:type]
    anime = Anime.find(params[:id])
    case type
    when "follow" 
      if !current_user.followed.find_by_id(anime.id)
        current_user.followed << anime
        redirect_to animes_path, notice: "You followed #{anime.name}"
      else
        redirect_to followed_path, notice: "You already follow this anime"
      end
    when "unfollow"
      current_user.followed.delete(anime)
      redirect_to followed_path, notice: "Unfollowd #{anime.name}"  
    end

  end

  def favorite
    type = params[:type]
    anime = Anime.find(params[:id])
    case type
    when "favorite"
      anime = current_user.follow_animes.find_by(anime_id: anime.id)
      anime.favorite = true
      anime.save
      redirect_to followed_path, notice: "You favorited sucessful"
    when "unfavorite"
      anime = current_user.follow_animes.find_by(anime_id: anime.id)
      anime.favorite = false
      anime.save
      redirect_to followed_path, notice: "Unfavorited sucessful"
    end
  end

  def follow_and_favorite
    params[:type] = 'follow'
    follow
    params[:type] = 'favorite'
    favorite
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
