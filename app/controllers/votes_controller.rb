class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /vote
  # GET /vote.json
  # GET /vote/help
  def help
    @votes = Vote.all
  end

  # GET /votes/new
  def new
    @state = params[:state]

    @parties = Party.order(:position).where(:state => @state)
    @candidates = Candidate.order(:party_pos).where(:state => @state)

    @party_options = [""] + (1..Party.count).to_a
    @candidate_options = [""] + (1..Candidate.count).to_a
  end

  def thank_you

  end

  # POST /votes
  # POST /votes.json
  def create
    state = params[:state]
    party_preference = view_context.PreferenceCleanUp params[:party].values, 1
    candidate_preference = view_context.PreferenceCleanUp params[:candidate].values, 6

    # puts "Candidate Prefe Controlelr is: #{candidate_preference}"

    # logger.debug(party_preference)
    # logger.debug(candidate_preference)
    # logger.debug(party_preference.join(','))
    # logger.debug(candidate_preference.join(','))

    preference = party_preference.join(',') + ',' + candidate_preference.join(',')
    vote = Vote.new(state: state, preference: preference)

    # puts preference

    respond_to do |format|
      if vote.save
        format.html { redirect_to thank_you_vote_path(), notice: 'Your vote was successfully saved.' }
      else
        format.html { redirect_to new_vote_path(state: state), flash: { error: vote.errors[:preference].join(', ') } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:preference)
    end
end
