require 'test_helper'

class StudentCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_course = student_courses(:one)
  end

  test "should get index" do
    get student_courses_url, as: :json
    assert_response :success
  end

  test "should create student_course" do
    assert_difference('StudentCourse.count') do
      post student_courses_url, params: { student_course: { course_id: @student_course.course_id, student_id: @student_course.student_id } }, as: :json
    end

    assert_response 201
  end

  test "should show student_course" do
    get student_course_url(@student_course), as: :json
    assert_response :success
  end

  test "should update student_course" do
    patch student_course_url(@student_course), params: { student_course: { course_id: @student_course.course_id, student_id: @student_course.student_id } }, as: :json
    assert_response 200
  end

  test "should destroy student_course" do
    assert_difference('StudentCourse.count', -1) do
      delete student_course_url(@student_course), as: :json
    end

    assert_response 204
  end
end
