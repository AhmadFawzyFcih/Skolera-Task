class Api::V1::StudentCoursesController < ApplicationController
# ============================================================
  before_action :set_student_course, only: [:show, :update]
  before_action :authenticate_user!
  before_action :is_student
# ============================================================
  def index #get student courses
    @student_courses = paginate StudentCourse.where(:student_id => student_id) , per_page: number_per_page
    options = {}
    options[:include] = [:course]
    options[:meta] = { status: true , links: pagination_links(@student_courses) }
    render json: StudentCourseSerializer.new(@student_courses , options).serialized_json , status: :ok    
  end
# ============================================================
  def show #display student course by id
    if @student_course
      options = {}
      options[:include] = [:course]
      options[:meta] = { status: true }
      render json: StudentCourseSerializer.new(@student_course , options).serialized_json , status: :ok      
    else
      render json: {data: "student course not found" , meta: {status: false} } , status: 404
    end
  end
# ============================================================
  def create #enroll in new course
    if !course_registered? #check if student has registered this course before ?
      @student_course = StudentCourse.new(student_course_params)
      if @student_course.save
        num_of_registered_courses
        options = {}
        options[:include] = [:course]
        options[:meta] = { status: true }
        render json: StudentCourseSerializer.new(@student_course , options).serialized_json , status: :created
      else
        render json: {data: @student_course.errors , meta: {status: false} } , status: :unprocessable_entity
      end
    else
      render json: {data: "you already have registered this course before" , meta: {status: false} } , status: :unprocessable_entity
    end
  end
# ============================================================
  def update
    if !course_registered? || (@student_course.course_id == course_registered?.course_id) #check if student has registered this course before ?
      if @student_course.update(student_course_params)
        options = {}
        options[:include] = [:course]
        options[:meta] = { status: true }
        render json: StudentCourseSerializer.new(@student_course , options).serialized_json , status: :ok
      else
        render json: {data: @student_course.errors , meta: {status: false} } , status: :unprocessable_entity
      end
    else
      render json: {data: "you already have registered this course before" , meta: {status: false} } , status: :unprocessable_entity
    end
  end
# ============================================================
  private
    #student only can perform those actions.
    def is_student
      if current_user.user_type != 1
        render json: {data: "you must login as student...!" , meta: {status: false} } , status: 401
      end
    end

    #get logged in student id
    def student_id
      current_user.student.id 
    end

    #check if student has registered this course before ?
    def course_registered?
      course_id  = params[:student_course][:course_id].to_i
      student_course_exist = StudentCourse.where(:course_id => course_id , :student_id => student_id).first
    end

    #update the number of registered courses
    def num_of_registered_courses
      student = Student.where(:id => student_id).first
        student.number_of_courses += 1
        student.save
    end

    def set_student_course
      @student_course = StudentCourse.where(:id => params[:id]).first
      if !@student_course
        render json: {data: "student course not found" , meta: {status: false} } , status: 404
      end
    end

    def student_course_params
      params.require(:student_course).permit(:course_id).merge(student_id: student_id)
    end
# ============================================================
end
