class RegistrationsController < Devise::RegistrationsController

    private

    def respond_with(resource, _opts = {})
      if resource.errors.empty?
          detect_user_type(resource)
      end
      render_resource(resource) 
    end

    def sign_up_params
      params.require(:user).permit(:email,:password, :name , :profile , :user_type)
    end

    def detect_user_type(resource)
      if resource.user_type == 1 # 1 refer to register new student
        student = Student.new
        student.user_id = resource.id
        student.save 
      elsif resource.user_type == 2 # 2 refer to register new teacher
        teacher = Teacher.new
        teacher.user_id = resource.id
        teacher.save         
      end
    end

end
