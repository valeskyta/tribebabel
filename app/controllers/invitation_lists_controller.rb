class InvitationListsController < ApplicationController
  before_action :set_invitation_list, only: [:show, :edit, :update, :destroy]

  # GET /invitation_lists
  # GET /invitation_lists.json
  def index
    @invitation_lists = InvitationList.all
  end

  # GET /invitation_lists/1
  # GET /invitation_lists/1.json
  def show
  end

  # GET /invitation_lists/new
  def new
    @invitation_list = InvitationList.new
  end

  # GET /invitation_lists/1/edit
  def edit
  end

  # POST /invitation_lists
  # POST /invitation_lists.json
  def create
    @invitation_list = InvitationList.new(invitation_list_params)

    respond_to do |format|
      if @invitation_list.save
        format.html { redirect_to @invitation_list, notice: 'Invitation list was successfully created.' }
        format.json { render :show, status: :created, location: @invitation_list }
      else
        format.html { render :new }
        format.json { render json: @invitation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitation_lists/1
  # PATCH/PUT /invitation_lists/1.json
  def update
    respond_to do |format|
      if @invitation_list.update(invitation_list_params)
        format.html { redirect_to @invitation_list, notice: 'Invitation list was successfully updated.' }
        format.json { render :show, status: :ok, location: @invitation_list }
      else
        format.html { render :edit }
        format.json { render json: @invitation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitation_lists/1
  # DELETE /invitation_lists/1.json
  def destroy
    @invitation_list.destroy
    respond_to do |format|
      format.html { redirect_to invitation_lists_url, notice: 'Invitation list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation_list
      @invitation_list = InvitationList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_list_params
      params.require(:invitation_list).permit(:event_id, :status, :user_id)
    end
end
