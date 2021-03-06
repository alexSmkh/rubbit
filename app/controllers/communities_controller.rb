class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[show edit update destroy]

  # GET /communities or /communities.json
  def index
    @communities = Community.all
  end

  # GET /communities/1 or /communities/1.json
  def show; end

  # GET /communities/new
  def new
    @community = current_user.communities.build
  end

  # GET /communities/1/edit
  def edit; end

  # POST /communities or /communities.json
  def create
    @community = current_user.communities.build(community_params)
    @community.user_id = current_user.id

    respond_to do |format|
      if @community.save
        format.html do
          redirect_to community_url(@community),
                      notice: 'Community was successfully created.'
        end
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @community.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /communities/1 or /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html do
          redirect_to community_url(@community),
                      notice: 'Community was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @community.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /communities/1 or /communities/1.json
  def destroy
    @community.destroy

    respond_to do |format|
      format.html do
        redirect_to communities_url,
                    notice: 'Community was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_community
    @community = Community.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def community_params
    params
      .require(:community)
      .permit(:name, :title, :description, :sidebar, :user_id)
  end
end
