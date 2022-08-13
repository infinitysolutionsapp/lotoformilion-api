class TransactionsController < ApplicationController
  # GET /game_houses
  def index
    @transactions = Transaction.all

    render json: @transactions
  end
end
