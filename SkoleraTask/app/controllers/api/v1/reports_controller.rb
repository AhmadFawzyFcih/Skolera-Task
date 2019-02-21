class Api::V1::ReportsController < ApplicationController
# ============================================================
  before_action :authenticate_user!
  before_action :is_admin , only: [:create]
# ============================================================
    def index 
        CsvUsersReportJob.perform_later
        render json: {data: base_url+"/users.csv" , meta: {status: true} } , status: :ok
    end
# ============================================================
private

#admin only can generate this report
def is_admin
  if current_user.user_type != 1001
    render json: {data: "you must login as admin...!" , meta: {status: false} } , status: 401
  end
end
# ============================================================
end
