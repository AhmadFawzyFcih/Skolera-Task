class Api::V1::TeacherCoursesController < ApplicationController
# ============================================================
  before_action :set_teacher_course, only: [:show, :update]
  before_action :authenticate_user!
  before_action :is_teacher
# ============================================================
  def index #get teacher courses
    @teacher_courses = paginate TeacherCourse.where(:teacher_id => teacher_id) , per_page: number_per_page
    options = {}
    options[:include] = [:course]
    options[:meta] = { status: true , links: pagination_links(@teacher_courses) }
    render json: TeacherCourseSerializer.new(@teacher_courses , options).serialized_json , status: :ok    
  end
# ============================================================
  def show #display teacher course by id
    if @teacher_course
      options = {}
      options[:include] = [:course]
      options[:meta] = { status: true }
      render json: TeacherCourseSerializer.new(@teacher_course , options).serialized_json , status: :ok      
    else
      render json: {data: "teacher course not found" , meta: {status: false} } , status: 404
    end
  end
# ============================================================
  def create #enroll in new course
    if !course_registered? #check if teacher have registered this course before ?
      @teacher_course = TeacherCourse.new(teacher_course_params)
      if @teacher_course.save
        options = {}
        options[:include] = [:course]
        options[:meta] = { status: true}
        render json: TeacherCourseSerializer.new(@teacher_course , options).serialized_json , status: :created 
      else
        render json: {data: @teacher_course.errors , meta: {status: false} } , status: :unprocessable_entity
      end
    else
      render json: {data: "you already have registered this course before" , meta: {status: false} } , status: :unprocessable_entity
    end
  end
# ============================================================
  def update
    if !course_registered? || (@teacher_course.course_id == course_registered?.course_id) #check if teacher have registered this course before ?
      if @teacher_course.update(teacher_course_params)
        options = {}
        options[:include] = [:course]
        options[:meta] = { status: true}
        render json: TeacherCourseSerializer.new(@teacher_course , options).serialized_json , status: :ok 
      else
        render json: {data: @teacher_course.errors , meta: {status: false} } , status: :unprocessable_entity
      end
    else
      render json: {data: "you already have registered this course before" , meta: {status: false} } , status: :unprocessable_entity
    end
  end
# ============================================================
  private

    #teacher only can perform those actions.
    def is_teacher
      if current_user.user_type != 2
        render json: {data: "you must login as teacher...!" , meta: {status: false} } , status: 401
      end
    end

    #get logged in teacher id
    def teacher_id
      current_user.teacher.id 
    end

    #check if teacher have registered this course before ?
    def course_registered?
      course_id  = params[:teacher_course][:course_id].to_i
      teacher_course_exist = TeacherCourse.where(:course_id => course_id , :teacher_id => teacher_id).first
    end

    def set_teacher_course
      @teacher_course = TeacherCourse.where(:id => params[:id]).first
      if !@teacher_course
        render json: {data: "teacher course not found" , meta: {status: false} } , status: 404
      end
    end

    def teacher_course_params
      params.require(:teacher_course).permit(:course_id).merge(teacher_id: teacher_id)
    end
# ============================================================
end
