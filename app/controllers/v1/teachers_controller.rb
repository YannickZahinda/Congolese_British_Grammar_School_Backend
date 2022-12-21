class V1::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
    render json: @teachers, status: :ok
  end

  def create
    @teacher = Teacher.new(teacher_params)  
    if @teacher.save
      render json: { data: 'teacher added successfully', status: :created }
    else 
      render json: { data: @teacher.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher = Teacher.where(id: params[:id]).first 
    if @teacher.destroy
      head(:ok)
    else  
      head(:unprocessable_entity)
    end
  end

  def show
    render json: @teachers.to_json(include: :parent)
  end

  private  

  def teacher_params
    params.require(:teacher).permit(:employee_code, :full_name, :incharge_class, :subject_handling, :phone_number)
  end

end
