require 'rest-client'
require 'json'

class GamesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_game, only: %i[ show update destroy ]

  def seq_gen_b(n, a=[*n])
    a.size==4 ? a : seq_gen_b(nil, a << a.last*2-3)
  end

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/new
  def new

    response = RestClient.get('https://login.portaldaloto.com.br/callbacks/concurso/lotofacil/limite/50', {accept: :json})
    dezenas = []
    results = JSON.parse(response.body)
    results.map { |result|
      dezenas.concat(result['dezenas'])
    }

    freq = Hash.new(0)
    dezenas.each { |x| freq[x] += 1 }
    pairs = Array.new(0)
    # dezenas.each { |n| freq[x] += 1 }
    ordered_frequency = Hash[freq.sort]

    b = []
    a_range = 1...26
    a = a_range.to_a   


    a.uniq.each { |i| b.push(a.count(i)/2)}

    response = {
      last_results: ordered_frequency,
      last_result: results.first,
      pairs: dezenas.uniq.sort.select { |n| n.to_i.even?  },
      odds: dezenas.uniq.sort.select { |n| !n.to_i.even?  },
    }

    @games = Game.all

    render json: response
  end


  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
  
    pairs = params[:pairs]
    odds = params[:odds]
    amount_of_dozens = params[:dozens]
    game = params[:game]
    amount_of_bets = 14
    amount_of_numbers_in_bet = 25
    sorted_numbers = []
    
    new_game = {}
    game_name = "JOGO-LOTERIA-#{Time.now.strftime("%m-%d-%Y")}"
    new_game[:name] = game_name
    @game = Game.new(new_game)


    if amount_of_dozens
      for bet_index in 1..amount_of_bets do
        for number in 1..amount_of_dozens do
            sorted_number = rand(1..amount_of_numbers_in_bet)
            sorted_numbers.push(sorted_number)
        end
        Bet.create(dozens: amount_of_dozens, move: sorted_numbers, Game: @game)
        sorted_numbers = []
      end      
    end

    if @game.save
      render json: { game: @game, bets: @game.bets }, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params
    end
end

