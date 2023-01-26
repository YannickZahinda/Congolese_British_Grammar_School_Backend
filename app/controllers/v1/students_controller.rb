class V1::StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_student, only: %i[show update destroy]

  def index
    @students = Student.all
    render json: @students, status: :ok
  end

  def create
    @student = Student.new(student_params)  
    if @student.save
      render json: { data: 'Student added successfully', status: :created }
    else 
      render json: { data: @student.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end       
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      render json: {data: 'Updated successfully', status: :ok}
    else  
      render json: {data: 'Something went wrong', status: 'failed'}
    end
  end

  def destroy
    if Student.destroy(params[:id])
      render json: {data: 'Deleted student successfully', status: :ok}
    else 
      render json: {data: 'Couldn\'t delete, something went wrong', status: 'failed'}
    end
  end

  def show
    render json: @students.to_json(include: :parent)
  end

  private  

  def set_student 
     @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:roll_number, :first_name, :parent, :street_address, :phone_number)
  end
end
