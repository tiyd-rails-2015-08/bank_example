class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def search
    if params[:search]
      q = "%#{params[:search]}%"
      @expenses = Expense.joins(account: {client: :branch}).
          where("payee LIKE ? OR accounts.name LIKE ? OR clients.name LIKE ? OR branches.name LIKE ?", q, q, q, q)

      # expenses = Expense.arel_table
      # @expenses = Expense.where(expenses[:payee].matches("%#{params[:search]}%"))
    end
  end

  def expenses_for
    @branch = Branch.find(params[:branch_id])
  end

  # GET /expenses
  def index
    @expenses = Expense.limit(100)
  end

  # GET /expenses/1
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:payee, :account_id, :spent_on)
    end
end
