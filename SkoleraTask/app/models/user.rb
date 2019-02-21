class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,jwt_revocation_strategy: JWTBlacklist

  mount_uploader :profile , ProfileUploader

  validates :name, presence: true , length: {maximum: 200}
  validates :profile ,file_size: { less_than_or_equal_to: 2.megabytes }, #megabytes or kilobytes
                       file_content_type: { allow: ['image/jpeg', 'image/png' , 'image/jpg'] }
  validates :user_type, presence: true, :inclusion=> { :in => [1001,1,2] } 
                                                    # (1001) for super admin 
                                                    # (1) for student  
                                                    # (2) for teacher 
  has_one :student
  has_one :teacher

end