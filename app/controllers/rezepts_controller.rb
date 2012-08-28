class RezeptsController < ApplicationController
  # GET /rezepts
  # GET /rezepts.json
  def index
    @rezepts = Rezept.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rezepts }
    end
  end

  # GET /rezepts/1
  # GET /rezepts/1.json
  def show
    @rezept = Rezept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rezept }
    end
  end

  # GET /rezepts/new
  # GET /rezepts/new.json
  def new
    @rezept = Rezept.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rezept }
    end
  end

  # GET /rezepts/1/edit
  def edit
    @rezept = Rezept.find(params[:id])
  end

  # POST /rezepts
  # POST /rezepts.json
  def create
    @rezept = Rezept.new(params[:rezept])

    respond_to do |format|
      if @rezept.save
        format.html { redirect_to @rezept, notice: 'Rezept was successfully created.' }
        format.json { render json: @rezept, status: :created, location: @rezept }
      else
        format.html { render action: "new" }
        format.json { render json: @rezept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rezepts/1
  # PUT /rezepts/1.json
  def update
    @rezept = Rezept.find(params[:id])

    respond_to do |format|
      if @rezept.update_attributes(params[:rezept])
        format.html { redirect_to @rezept, notice: 'Rezept was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rezept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rezepts/1
  # DELETE /rezepts/1.json
  def destroy
    @rezept = Rezept.find(params[:id])
    @rezept.destroy

    respond_to do |format|
      format.html { redirect_to rezepts_url }
      format.json { head :no_content }
    end
  end
end
