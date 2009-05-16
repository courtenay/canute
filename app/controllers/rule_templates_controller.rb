class RuleTemplatesController < ApplicationController
  # GET /rule_templates
  # GET /rule_templates.xml
  def index
    @rule_templates = RuleTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rule_templates }
    end
  end

  # GET /rule_templates/1
  # GET /rule_templates/1.xml
  def show
    @rule_template = RuleTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule_template }
    end
  end

  # GET /rule_templates/new
  # GET /rule_templates/new.xml
  def new
    @rule_template = RuleTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule_template }
    end
  end

  # GET /rule_templates/1/edit
  def edit
    @rule_template = RuleTemplate.find(params[:id])
  end

  # POST /rule_templates
  # POST /rule_templates.xml
  def create
    @rule_template = RuleTemplate.new(params[:rule_template])
    
    respond_to do |format|
      if @rule_template.save
        flash[:notice] = 'RuleTemplate was successfully created.'
        format.html { redirect_to(@rule_template) }
        format.xml  { render :xml => @rule_template, :status => :created, :location => @rule_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rule_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rule_templates/1
  # PUT /rule_templates/1.xml
  def update
    @rule_template = RuleTemplate.find(params[:id])

    respond_to do |format|
      if @rule_template.update_attributes(params[:rule_template])
        flash[:notice] = 'RuleTemplate was successfully updated.'
        format.html { redirect_to(@rule_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rule_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rule_templates/1
  # DELETE /rule_templates/1.xml
  def destroy
    @rule_template = RuleTemplate.find(params[:id])
    @rule_template.destroy

    respond_to do |format|
      format.html { redirect_to(rule_templates_url) }
      format.xml  { head :ok }
    end
  end
end
