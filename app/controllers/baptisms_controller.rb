class BaptismsController < ApplicationController

  def index
    @baptisms = current_church.baptisms
  end

  def show
    @baptism = Baptism.find(params[:id])
  end

  def new
    @baptism = Baptism.new(date: Date::today,
                           baptised: Person.new,
                           mother: Person.new,
                           father: Person.new,
                           godmother: Person.new,
                           godfather: Person.new)
  end

  def edit
    @baptism = Baptism.find(params[:id])
  end

  def create
    @baptism = Baptism.new(baptism_params)
    if (@baptism.save)
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def update
    @baptism = Baptism.find(params[:id])
    @baptism.update(baptism_params)
    if (@baptism.save)
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def print
    @baptism = Baptism.find(params[:id])
    pdf = BaptismPdf.new(@baptism)
    send_data pdf.render, filename: 'print.pdf',
                          type: 'application/pdf',
                          disposition: 'inline'
  end

  private

    def baptism_params
      params.require(:baptism).permit(:priest_id, :date, :baptised_id, :mother_id, :father_id, :godmother_id, :godfather_id)
    end

end
