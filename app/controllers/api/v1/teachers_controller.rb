module Api
  module V1
    class TeachersController < ApplicationController

      def index
        all_teachers = Teacher.all
        render json: all_teachers, status: :ok
      end

      def create
        new_teacher = Teacher.new(teacher_params)

        if new_teacher.save
          render json: new_teacher, status: :created
        else
          render json: {error:new_teacher.errors[:name]}, status: :unprocessable_entity
        end

      end

      def update
        updated_teacher = Teacher.find(params[:id])

        if updated_teacher.update(teacher_params)
          render json: updated_teacher, status: :ok
        else
          render json: {error:updated_teacher.errors[:name]}, status: :unprocessable_entity
        end
      end

      def show
        teacher_by_id = Teacher.find(params[:id])

        render json: teacher_by_id, status: :ok
      end


      def destroy
        teacher_to_delete = Teacher.find(params[:id])

        if teacher_to_delete.destroy
          render json: teacher_to_delete, status: :no_content
        else
          render json: {error:teacher_to_delete.errors[:name]}, status: :unprocessable_entity
        end
      end

      private
      def teacher_params
        params.require(:teacher).permit(:name,:age,:address)
      end
    end

  end
end
