class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project
      .includes(:builder)
      .search(params[:keyword])
      .unverified(params[:unverified])

    ## Redirect to a project if this was a search with only 1 result
    if @projects.count == 1 and params[:keyword].present?
      redirect_to @projects.first, notice: "You were redirected"
    end

    build_map_markers @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @blurbs = Blurb.for_project(@project.id)
    ## Create an empty Blurb for the 'add blurb' form
    @blurb = Blurb.new(:project => @project)
    3.times {  @blurb.images.build }

    @blurb_panel_id = params[:blurb_id].to_i
  end

  # GET /projects/new
  def new
    @project = Project.new
    build_map_markers Project.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    @project.builder = Builder.find_by_name('nestoria') if @project.builder.nil?

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /projects/typeahead.json
  def typeahead
    searchterm = params[:a]
    project_names =  Project.all.collect(&:title).grep(/#{searchterm}/i).map { |title| { value: title } }


    respond_to do |format|
      format.json { render json: project_names }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :title, :verified, :latitude, :longitude, :builder_id)
    end

    def build_map_markers(projects)
      @map_markers = Gmaps4rails.build_markers(projects) do | project, marker |
        marker.lat project.latitude
        marker.lng project.longitude
        marker.infowindow project.title
      end
    end
end
