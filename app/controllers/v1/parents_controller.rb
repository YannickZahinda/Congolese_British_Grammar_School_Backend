class V1::ParentsController < ApplicationController

  def index
    @parents = Parent.all
    render json: @parents, status: :ok
  end

  def create
    @parent = Parent.new(parent_params)  
    if @parent.save
      render json: { data: 'parent added successfully', status: :created }
    else
      render json: { data: @parent.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update(teacher_params)
      render json: {data: 'Parent updated successfully',status: :ok}
    else 
      render json: {data: 'Couldn\'t update parent, something went wrong', status: 'failed'}
    end
  end
  
  def destroy
    if Parent.destroy(params[:id])
      head(:ok)
    else  
      head (:unprocessable_entity)
    end
  end
  
  def show
    render json: @parents.to_json(include: :parent)
  end
    
  private    

  def parent_params
    params.require(:parent).permit(:full_name, :student_name, :parent_email)
  end
end
