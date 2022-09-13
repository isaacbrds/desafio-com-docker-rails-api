module V1
  class LecturesController < ApplicationController
    before_action :set_lecture, only: %i[show update destroy]
    def index
      @lectures = Lecture.all 
    end

    def create
      @lecture = Lecture.new(lecture_params)
      if @lecture.save
        render :show
      else
        render json: @lecture.errors, status: :unprocessable_entity
      end
    end
    def show; end

    def update
      if @lecture.update(lecture_params)
        render :show
      else
        render json: @lecture.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @lecture.destroy
    end

    private

    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    def lecture_params
      params.require(:lecture).permit(:title, :attendee, :start_time, :session_id)
    end
  end


end