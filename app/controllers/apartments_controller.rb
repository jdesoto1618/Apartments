class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /apartments
  # GET /apartments.json
  def index
    @ability = Ability.new(current_user)
    @apartments= Apartment.all
    if params[:search].nil? || params[:search].empty?
      @apartments = Apartment.all
    else
      @apartments = Apartment.basic_search(params[:search])
      render "/apartments/index"
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @user = current_user
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new(user_id: current_user.id)
  end

  # GET /apartments/1/edit
  def edit
    @user = current_user.id
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @user = current_user
    @apartment = Apartment.new(apartment_params)
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end #ends if
    end #ends for loop
  end #ends create

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @user = current_user
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:street, :city, :zipcode, :state, :country, :name, :phone, :hours, :image, :user_id)
    end
end
