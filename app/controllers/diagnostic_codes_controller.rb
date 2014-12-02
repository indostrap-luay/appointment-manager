class DiagnosticCodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diagnostic_code, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @diagnostic_codes = DiagnosticCode.all
  end

  def show
    respond_with(@diagnostic_code)
  end

  def new
    @diagnostic_code = DiagnosticCode.new
    respond_with(@diagnostic_code)
  end

  def edit
  end

  def create
    @diagnostic_code = DiagnosticCode.new(diagnostic_code_params)

    if @diagnostic_code.save
      redirect_to diagnostic_codes_path, notice: "Was save"
    else
      render "new"
    end
  end

  def update
    @diagnostic_code.update(diagnostic_code_params)
    respond_with(@diagnostic_code)
  end

  def destroy
    @diagnostic_code.destroy
    respond_with(@diagnostic_code)
  end

  private
    def set_diagnostic_code
      @diagnostic_code = DiagnosticCode.find(params[:id])
    end

    def diagnostic_code_params
      params.require(:diagnostic_code).permit(:description, :code, :price)
    end
end