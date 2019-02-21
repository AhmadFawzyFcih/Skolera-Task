class Api::V1::CoursesController < ApplicationController
# ============================================================
  before_action :authenticate_user!
  before_action :is_admin , only: [:create]
# ============================================================
  def index
    @courses = paginate Course.all , per_page: number_per_page
    options = {}
    options[:meta] = { status: true , links: pagination_links(@courses) }
    render json: CourseSerializer.new(@courses , options).serialized_json , status: :ok
  end
# ============================================================
  def create
    @course = Course.new(course_params)
    if @course.save
      options = {}
      options[:meta] = { status: true }
      render json: CourseSerializer.new(@course , options).serialized_json, status: :created
    else
      render json: {data: @course.errors , meta: {status: false} } , status: :unprocessable_entity
    end
  end
# ============================================================
  private

  #admin only can create new course
  def is_admin
    if current_user.user_type != 1001
      render json: {data: "you must login as admin...!" , meta: {status: false} } , status: 401
    end
  end

  def course_params
      params.require(:course).permit(:name, :description, :number_of_hours, :semester)
  end
# ============================================================  
end
