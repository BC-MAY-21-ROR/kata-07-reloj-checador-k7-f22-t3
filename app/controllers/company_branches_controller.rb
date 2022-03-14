class CompanyBranchesController < ApplicationController
  before_action :set_company_branch, only: %i[show edit update destroy]

  # GET /company_branches or /company_branches.json
  def index
    @company_branches = CompanyBranch.all
  end

  # GET /company_branches/1 or /company_branches/1.json
  def show
  end

  # GET /company_branches/new
  def new
    @company_branch = CompanyBranch.new
  end

  # GET /company_branches/1/edit
  def edit
  end

  # POST /company_branches or /company_branches.json
  def create
    @company_branch = CompanyBranch.new(company_branch_params)

    respond_to do |format|
      if @company_branch.save
        format.html { redirect_to company_branch_url(@company_branch), notice: 'CompanyBranch was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_branches/1 or /company_branches/1.json
  def update
    respond_to do |format|
      if @company_branch.update(company_branch_params)
        format.html { redirect_to company_branch_url(@company_branch), notice: 'company_branch was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_branches/1 or /company_branches/1.json
  def destroy
    @company_branch.destroy

    respond_to do |format|
      format.html { redirect_to company_branches_url, notice: 'company_branch was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_branch
      @company_branch = CompanyBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_branch_params
      params.require(:company_branch).permit(:name, :address)
    end
end
