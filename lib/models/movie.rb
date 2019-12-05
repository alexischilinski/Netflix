class Movie < ActiveRecord::Base
    belongs_to :genre
    has_many :movie_users
    has_many :users, through: :movie_users
    
end