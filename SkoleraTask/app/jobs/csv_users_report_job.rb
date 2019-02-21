class CsvUsersReportJob < ApplicationJob
  require 'csv'
  queue_as :default

  def perform(*args)
    @users = User.all
    CSV.open('public/users.csv' , 'wb') do |csv|
      csv << ['User Name' , 'Email' , "User Type"]
      @users.each do |user|
        type = ""
        if user.user_type == 1
          type = "Student"
        elsif user.user_type == 2
          type = "Teacher"
        else
          type = "Admin"
        end
        csv << [user.name , user.email , type]
      end
    end

    p "users.csv generated...!"
  end

end
