class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: 'スケジュールを作成しました。'
    else
      flash.now[:alert] = 'スケジュールの作成に失敗しました。'
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule), notice: 'スケジュールを更新しました。'
    else
      flash.now[:alert] = 'スケジュールの更新に失敗しました。'
      render :edit
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: 'スケジュールを削除しました。'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end
