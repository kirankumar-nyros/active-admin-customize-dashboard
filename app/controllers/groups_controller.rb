class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @contacts = Contact.all
    @skills = Skill.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @contacts = Contact.all
    @skills = Skill.all
  end

  # GET /groups/new
  def new
    @group = Group.new
    @contacts = Contact.all
    @skills = Skill.all
  end

  # GET /groups/1/edit
  def edit
    @contacts = Contact.all
    @skills = Skill.all
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @contacts = Contact.all
    @skills = Skill.all
    checked_skills = check_skills_using(params[:skill_list])
    uncheck_missing_skills(@skills, checked_skills)
    
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @contacts = Contact.all
    @skills = Skill.all
    checked_skills = check_skills_using(params[:skill_list])
    uncheck_missing_skills(@skills, checked_skills)
    
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    @contacts = Contact.all
    @skills = Skill.all
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def check_skills_using( skill_id_array )
    checked_skills = []
    checked_params = skill_id_array || []
    for check_box_id in checked_params
      skill = Skill.find(check_box_id)
      if not @group.skills.include?(skill)
        @group.skills << skill
      end
      checked_skills << skill
    end
    return checked_skills
  end
  
  def uncheck_missing_skills( skills, checked_skills)
    missing_skills = skills- checked_skills
    for skill in missing_skills
      if @group.skills.include?(skill)
         @group.skills.delete(skill)
       end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end
end
