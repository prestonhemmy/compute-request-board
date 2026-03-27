class ComputeRequestsController < ApplicationController
  before_action :set_compute_request, only: %i[ show edit update destroy ]

  # GET /compute_requests or /compute_requests.json
  def index
    @compute_requests = ComputeRequest.all

    # filtering
    if params[:priority].present?
      @compute_requests = @compute_requests.by_priority(params[:priority])
    end

    if params[:lab].present?
      @compute_requests = @compute_requests.by_user_lab(params[:lab])
    end

    # metrics
    @total_requests = @compute_requests.size
    @gpu_count = @compute_requests.gpus_allocated
    @pending_cpu_hours = @compute_requests.pending_cpu_hours
    # @status_counts = @compute_requests.status_counts
    @urgent_count = @compute_requests.urgent_count

    @grouped_requests = @compute_requests.group_by(&:status)
  end

  # GET /compute_requests/1 or /compute_requests/1.json
  def show
  end

  # GET /compute_requests/new
  def new
    @compute_request = ComputeRequest.new
  end

  # GET /compute_requests/1/edit
  def edit
  end

  # POST /compute_requests or /compute_requests.json
  def create
    @compute_request = ComputeRequest.new(compute_request_params)

    respond_to do |format|
      if @compute_request.save
        format.html { redirect_to @compute_request, notice: "Compute request was successfully created." }
        format.json { render :show, status: :created, location: @compute_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @compute_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compute_requests/1 or /compute_requests/1.json
  def update
    respond_to do |format|
      if @compute_request.update(compute_request_params)
        format.html { redirect_to @compute_request, notice: "Compute request was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @compute_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @compute_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compute_requests/1 or /compute_requests/1.json
  def destroy
    @compute_request.destroy!

    respond_to do |format|
      format.html { redirect_to compute_requests_path, notice: "Compute request was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compute_request
      @compute_request = ComputeRequest.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def compute_request_params
      params.expect(compute_request: [ :title, :user_id, :gpu_count, :cpu_cores, :memory_gb, :hours, :partition, :priority, :status, :notes, :created_at, :updated_at ])
    end
end
