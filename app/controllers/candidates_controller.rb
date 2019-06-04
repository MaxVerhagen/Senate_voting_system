class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  


  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    party = Party.find params[:party_id]

    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to edit_party_path(party), notice: 'Candidate was successfully updated.' }
      else
        format.html { redirect_to edit_party_candidate_path(party), flash: { error: @candidate.errors.full_messages.join(', ') } }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    party = Party.find params[:party_id]
    candidate = Candidate.find params[:id]
    party.candidates.destroy candidate
    party.re_order_party_pos

    respond_to do |format|
      format.html { redirect_to edit_party_path(party), notice: "#{candidate.given_name} #{candidate.surname} was successfully removed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:given_name, :surname, :divison_name, :state, :party_pos)
  end
end
