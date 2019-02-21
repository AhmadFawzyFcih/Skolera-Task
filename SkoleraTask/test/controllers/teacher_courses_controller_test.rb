require 'test_helper'

class TeacherCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_course = teacher_courses(:one)
  end

  test "should get index" do
    get teacher_courses_url, as: :json
    assert_response :success
  end

  test "should create teacher_course" do
    assert_difference('TeacherCourse.count') do
      post teacher_courses_url, params: { teacher_course: { course_id: @teacher_course.course_id, teacher_id: @teacher_course.teacher_id } }, as: :json
    end

    assert_response 201
  end

  test "should show teacher_course" do
    get teacher_course_url(@teacher_course), as: :json
    assert_response :success
  end

  test "should update teacher_course" do
    patch teacher_course_url(@teacher_course), params: { teacher_course: { course_id: @teacher_course.course_id, teacher_id: @teacher_course.teacher_id } }, as: :json
    assert_response 200
  end

  test "should destroy teacher_course" do
    assert_difference('TeacherCourse.count', -1) do
      delete teacher_course_url(@teacher_course), as: :json
    end

    assert_response 204
  end
end
