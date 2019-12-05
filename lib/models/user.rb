class User < ActiveRecord::Base
    has_many :movie_users
    has_many :movies, through: :movie_users
end