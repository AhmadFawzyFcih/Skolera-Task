class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email , :name , :profile , :user_type

  attribute :profile do |object, params|
    # in here, params is a hash containing the `:current_user` key
    params[:base_url]+object.profile.url
  end
  
end
