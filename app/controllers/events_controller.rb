class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    @events = Event.all

    start_date = Date.today # your start
    end_date = Date.today + 1.year # your end
    loto_dates = [0,2,3,4,5,6] # day of the week in 0-6. Sunday is day-of-week 0; Saturday is day-of-week 6.
    loto_dates_result = (start_date..end_date).to_a.select {|k| loto_dates.include?(k.wday)}
    quina_dates = [0,2,3,4,5,6] # day of the week in 0-6. Sunday is day-of-week 0; Saturday is day-of-week 6.
    quina_dates_result = (start_date..end_date).to_a.select {|k| quina_dates.include?(k.wday)}
    loto_mania_dates = [2,4,6]
    loto_mania_dates_result = (start_date..end_date).to_a.select {|k| loto_mania_dates.include?(k.wday)}
    mega_sena_dates = [0, 4]
    mega_sena_dates_result = (start_date..end_date).to_a.select {|k| mega_sena_dates.include?(k.wday)}


    loto_facil_events_events = []
    loto_facil_events = loto_dates_result.map { |result|
        loto_facil_events_events.push({title:"LOTOFÁCIL 20h sorteio", start: result.strftime("%Y/%m/%d %H:%M"), end: result.strftime("%Y/%m/%d %H:%M"), allDay:false, color:"#ad00e2"  })
    }

    quina_events_events = []
    quina_events = quina_dates_result.map { |result|
        quina_events_events.push({title:"Quina 20h sorteio", start: result.strftime("%Y/%m/%d %H:%M"), end: result.strftime("%Y/%m/%d %H:%M"), allDay:false, color:"#260085"  })
    }

    loto_mania_events_events = []
    loto_mania_events = loto_mania_dates_result.map { |result|
        loto_mania_events_events.push({title:"Lotomania 20h sorteio", start: result.strftime("%Y/%m/%d %H:%M"), end: result.strftime("%Y/%m/%d %H:%M"), allDay:false, color:"#f78100"  })
    }

    mega_sena_events_events = []
    mega_sena_events = mega_sena_dates_result.map { |result|
        mega_sena_events_events.push({title:"Mega Sena 20h sorteio", start: result.strftime("%Y/%m/%d %H:%M"), end: result.strftime("%Y/%m/%d %H:%M"), allDay:false, color:"#209869"  })
    }

    all_events = {
      loto_facil: loto_facil_events_events,
      quina: quina_events_events,
      lotomania: loto_mania_events_events,
      mega_sena: mega_sena_events_events
    }

    render json: all_events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :color)
    end
end
