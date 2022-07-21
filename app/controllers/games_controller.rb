require 'rest-client'
require 'json'

class GamesController < ApplicationController
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

    p freq

    @games = Game.all

    render json: response
  end


  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
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
      params.require(:game).permit(:GameCategory_id, :GameHouse_id, :name, :last_results)
    end
end
