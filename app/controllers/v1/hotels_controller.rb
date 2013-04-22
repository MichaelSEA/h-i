class V1::HotelsController < V1::BaseController
    
  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
    render json: @hotels
    # render Hotel.all.as_json(:include => "country")
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.includes(:country).find(params[:id])

    render json: @hotel
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(params[:hotel])

    if @hotel.save
      render json: @hotel, status: :created, location: @hotel
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update_attributes(params[:hotel])
      head :no_content
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    head :no_content
  end
end
