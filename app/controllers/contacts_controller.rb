class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  # GET /contacts
  # GET /contacts.json
  
  def index
    @contacts = Contact.all
    @skills = Skill.all
    @groups = Group.all
    @contacts.size
  
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show

  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @skills = Skill.all
    @groups = Group.all
  end

  # GET /contacts/1/edit
  def edit
    @skills = Skill.all
    @groups = Group.all
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @skills = Skill.all
    @groups = Group.all
    checked_skills = check_skills_using(params[:skill_list])
    uncheck_missing_skills(@skills, checked_skills)
    checked_groups = check_groups_using(params[:group_list])
    uncheck_missing_groups(@groups, checked_groups)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @skills = Skill.all
    @groups = Group.all
    checked_skills = check_skills_using(params[:skill_list])
    uncheck_missing_skills(@skills, checked_skills)
    checked_groups = check_groups_using(params[:group_list])
    uncheck_missing_groups(@groups, checked_groups)
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    @skills = Skill.all
    @groups = Group.all
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def check_skills_using( skill_id_array )
    checked_skills = []
    checked_params = skill_id_array || []
    for check_box_id in checked_params
      skill = Skill.find(check_box_id)
      if not @contact.skills.include?(skill)
        @contact.skills << skill
      end
      checked_skills << skill
    end
    return checked_skills
  end
  
  def uncheck_missing_skills( skills, checked_skills)
    missing_skills = skills- checked_skills
    for skill in missing_skills
      if @contact.skills.include?(skill)
         @contact.skills.delete(skill)
       end
    end
  end
  #########
  def check_groups_using( group_id_array )
    checked_groups = []
    checked_params = group_id_array || []
    for check_box_id in checked_params
      group = Group.find(check_box_id)
      if not @contact.groups.include?(group)
        @contact.groups << group
      end
      checked_groups << group
    end
    return checked_groups
  end
  
  def uncheck_missing_groups( groups, checked_groups)
    missing_groups = groups- checked_groups
    for group in missing_groups
      if @contact.groups.include?(group)
         @contact.groups.delete(group)
       end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:Name, :Company, :Age, :Email, :Password)
    end
end
