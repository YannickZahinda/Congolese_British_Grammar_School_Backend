class V1::StudentsController < ApplicationController
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

  def destroy
    @student = Student.where(id: params[:id]).first 
    if @student.destroy
      head(:ok)
    else  
      head(:unprocessable_entity)
    end
  end

  def show
    render json: @students.to_json(include: :parent)
  end

  private  

  def student_params
    params.require(:student).permit(:roll_number, :first_name, :parent, :street_address, :phone_number)
  end
end
