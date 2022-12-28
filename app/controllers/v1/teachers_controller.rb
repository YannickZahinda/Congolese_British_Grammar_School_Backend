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

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      render json: {data: 'Teacher updated successfully', status: :ok}
    else
      render json: {data: 'Couldn\'t update teacher', status: 'failed'}
    end
  end

  def destroy
    if Teacher.destroy(params)
      render json: { data: 'Deleted Teacher Successfully', status: :ok }
    else
      render json: { data: 'Successfully went wrong', status: 'failed' }
    end
  end

  def show
    render json: @teachers.to_json(include: :parent)
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:employee_code, :full_name, :incharge_class, :subject_handling, :phone_number)
  end

end
