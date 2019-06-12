class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end
  
  

  # GET /parties/1
  # GET /parties/1.json
  def show
    @candidates = @party.all_candidates_in_order
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
    @candidates = @party.all_candidates_in_order
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
      respond_to do |format|
        if @party.update(party_params)
          format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        else
          format.html { redirect_to edit_party_path(@party), flash: { error: @party.errors.full_messages.join(', ') } }
        end
      end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.  
    def party_params
      params.require(:party).permit(:name, :name_ab, :created_at, :updated_at)
    end
end
