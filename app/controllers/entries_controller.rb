class EntriesController < ApplicationController
  def index
    @date_range = (Date.today - 30..Date.today)

    @entries_by_date =
      current_user.entries.
        where(date: @date_range).
        order(date: :desc).
        includes(:meals).
        index_by(&:date)
  end

  def show
    @entry = find_entry
  end

  def update
    @entry = find_entry

    if @entry.update entry_params
      redirect_to entry_path(@entry.date.to_s), notice: 'Entry updated'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def find_entry
    current_user.entries.where(date: params[:id]).first_or_create
  end

  def entry_params
    params.require(:entry).permit(:weight, :complete)
  end
end
