class DocumentListRequestsController < ApplicationController
  before_action :set_document_list_request, only: [:show, :edit, :update, :destroy]

  # GET /document_list_requests
  # GET /document_list_requests.json
  def index
    @document_list_requests = DocumentListRequest.all
  end

  # GET /document_list_requests/1
  # GET /document_list_requests/1.json
  def show
  end

  # GET /document_list_requests/new
  def new
    @document_list_request = DocumentListRequest.new
  end

  # GET /document_list_requests/1/edit
  def edit
  end

  # POST /document_list_requests
  # POST /document_list_requests.json
  def create
    @document_list_request = DocumentListRequest.new(document_list_request_params)

    respond_to do |format|
      if @document_list_request.save
        format.html { redirect_to @document_list_request, notice: 'Document list request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document_list_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @document_list_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_list_requests/1
  # PATCH/PUT /document_list_requests/1.json
  def update
    respond_to do |format|
      if @document_list_request.update(document_list_request_params)
        format.html { redirect_to @document_list_request, notice: 'Document list request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document_list_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_list_requests/1
  # DELETE /document_list_requests/1.json
  def destroy
    @document_list_request.destroy
    respond_to do |format|
      format.html { redirect_to document_list_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_list_request
      @document_list_request = DocumentListRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_list_request_params
      params.require(:document_list_request).permit(:celebrityIds, :limit, :view, :orderBy, :profileId, :star0Factor, :star1Factor, :star2Factor, :star3Factor, :star4Factor, :docSentimentFactor, :celebSentimentFactor, :unblockThreshold)
    end
end
