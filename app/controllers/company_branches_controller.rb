# frozen_string_literal: true

# Controller for branches
class CompanyBranchesController < ApplicationController
  before_action :set_company_branch, only: %i[show edit update destroy]

  def index
    @company_branches = CompanyBranch.all
  end

  def show; end

  def new
    @company_branch = CompanyBranch.new
  end

  def edit; end

  def create
    @company_branch = CompanyBranch.new(company_branch_params)

    respond_to do |format|
      if @company_branch.save
        format.html do
          redirect_to company_branch_url(@company_branch), notice: t('.created')
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company_branch.update(company_branch_params)
        format.html do
          redirect_to company_branch_url(@company_branch), notice: t('.updated')
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company_branch.destroy

    respond_to do |format|
      format.html { redirect_to company_branches_url, notice: t('.destroyed') }
    end
  end

  private
  def set_company_branch
    @company_branch = CompanyBranch.find(params[:id])
  end

  def company_branch_params
    params.require(:company_branch).permit(:name, :address)
  end
end
