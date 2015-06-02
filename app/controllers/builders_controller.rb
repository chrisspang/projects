class BuildersController < ApplicationController
  before_action :set_builder, only: [:show, :edit, :update, :destroy]

  # GET /builders
  # GET /builders.json
  def index
    @builders = Builder.all
  end

  # GET /builders/1
  # GET /builders/1.json
  def show
  end

  # GET /builders/new
  def new
    @builder = Builder.new
  end

  # GET /builders/1/edit
  def edit
  end

  # POST /builders
  # POST /builders.json
  def create
    @builder = Builder.new(builder_params)

    respond_to do |format|
      if @builder.save
        format.html { redirect_to @builder, notice: 'Builder was successfully created.' }
        format.json { render :show, status: :created, location: @builder }
      else
        format.html { render :new }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /builders/1
  # PATCH/PUT /builders/1.json
  def update
    respond_to do |format|
      if @builder.update(builder_params)
        format.html { redirect_to @builder, notice: 'Builder was successfully updated.' }
        format.json { render :show, status: :ok, location: @builder }
      else
        format.html { render :edit }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builders/1
  # DELETE /builders/1.json
  def destroy
    @builder.destroy
    respond_to do |format|
      format.html { redirect_to builders_url, notice: 'Builder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_builder
      @builder = Builder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def builder_params
      params.require(:builder).permit(:name, :title)
    end
end
