class RuleSetsController < ApplicationController
  # GET /rule_sets
  # GET /rule_sets.xml
  def index
    @rule_sets = RuleSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rule_sets }
    end
  end

  # GET /rule_sets/1
  # GET /rule_sets/1.xml
  def show
    @rule_set = RuleSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule_set }
    end
  end

  # GET /rule_sets/new
  # GET /rule_sets/new.xml
  def new
    @rule_set = RuleSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule_set }
    end
  end

  # GET /rule_sets/1/edit
  def edit
    @rule_set = RuleSet.find(params[:id])
  end

  # POST /rule_sets
  # POST /rule_sets.xml
  def create
    @rule_set = RuleSet.new(params[:rule_set])

    respond_to do |format|
      if @rule_set.save
        flash[:notice] = 'RuleSet was successfully created.'
        format.html { redirect_to(@rule_set) }
        format.xml  { render :xml => @rule_set, :status => :created, :location => @rule_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rule_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rule_sets/1
  # PUT /rule_sets/1.xml
  def update
    @rule_set = RuleSet.find(params[:id])

    respond_to do |format|
      if @rule_set.update_attributes(params[:rule_set])
        flash[:notice] = 'RuleSet was successfully updated.'
        format.html { redirect_to(@rule_set) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rule_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rule_sets/1
  # DELETE /rule_sets/1.xml
  def destroy
    @rule_set = RuleSet.find(params[:id])
    @rule_set.destroy

    respond_to do |format|
      format.html { redirect_to(rule_sets_url) }
      format.xml  { head :ok }
    end
  end
end
