# Skolera-Task

1-This is a simple application that simulate the process in schools, including courses, teachers and students there are 3 types of users in the system such as Admin , Student and Teacher through this app you can :-
   
 - create an account and choose type such as teacher or student.
 - display all courses in the system to choose from it.
 - login as student to choose courses and enroll or update or display it.
 - login as teacher to choose courses that you will teach or update or display it.
 - login as admin to create a new course or display users report in csv file.

2-Here are the installation steps to run the project :

   - Ruby version  : 2.3.3
   - Rails version : 5.1.6.1
   - Redis-server version : 3.2.1
   - create mysql database
   - enter the project and run this command : bundle install
   - run the database migrations : rails db:migrate
   - run database seed file to intialize database with some default data : rails db:seed
   - run Redis-server on its default port 6379
   - run the project with this command : rails s
   - run sidekiq to run your jobs in BG with this command : sidekiq

3-Login to the system with this credentials :

      -you can login as admin with this credentials
        *email    : admin@gmail.com
        *password : 123456

      -you can login as teacher with this credentials
        *email    : teacher@gmail.com
        *password : 123456        

      -you can login as admin with this credentials
        *email    : student@gmail.com
        *password : 123456

4-Import apis collection to your postman : https://www.getpostman.com/collections/a0f798279cff8550505a

5-Those apis not require to be authenticated :
    
    -you can sign in  : /login
    -you can sign up as student or teacher : /register
        *if you want to register as student set user_type params to 1
        *if you want to register as teacher set user_type params to 2
    
6-Those apis require to be authenticated (set your jwt authentication token to the header) :

      - you can logout : /logout

      - you can display all courses : /api/v1/courses  

      - login as admin first and you can create new course : /api/v1/courses
      - login as admin first and you can generate users report in BG : /api/v1/reports

      - login as student to enroll course : /api/v1/student_courses 
      - login as student to update enrollment : /api/v1/student_courses/2
      - login as student to retrieves all registered courses : /api/v1/student_courses 
      - login as student to retrieves a specific registered course by id : /api/v1/student_courses/1 

      - login as teacher to register courses that you will teach : /api/v1/teacher_courses 
      - login as teacher to update the choosen courses : /api/v1/teacher_courses/1
      - login as teacher to retrieves all registered courses : /api/v1/teacher_courses
      - login as teacher to retrieves a specific registered course by id : /api/v1/teacher_courses/1 

    