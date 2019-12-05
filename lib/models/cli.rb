class Cli
    attr_accessor :user

    def initialize user=nil
        @user = user
    end

    def start
        puts "Welcome to Movie Finder!"
        get_username
    end

    def create_username
        puts "Please choose a username:"
        user_name = gets.chomp
        if User.exists?(username: user_name)
            puts "Sorry that username has been taken."
            create_username
        else 
            user.update_attributes(username: user_name)
        end       
    end

    def verify_username
        puts "Please enter your username:"
        if gets.chomp != User.find_by(name: @user_full_name).username
            puts "That username does not match our records."
            verify_username
        else
            self.user = User.find_by(name: @user_full_name)
            puts "Welcome back, #{@first_name}!"
            puts "Let us recommend a movie for you!"
        end
    end

    def get_username
        puts "First, what is your full name?"
        if @user_full_name = gets.chomp.downcase
              @first_name = @user_full_name.split(' ')[0]
                if !User.exists?(name: @user_full_name)
                    self.user = User.create(name: @user_full_name)
                    puts "Let us recommend a movie for you!"
                        create_username
                    puts "Thank you, #{@first_name}!"
                else
                    verify_username
                end
            end
            menu
        end

    def menu
        prompt = TTY::Prompt.new
        menu_selection = prompt.select("Choose what you'd like to do next:", ["Find a movie", "View my watchlist", "Exit Movie Finder"])
            if menu_selection == "Find a movie"
                select_genre
            elsif menu_selection == "View my watchlist"
                view_all_movies
            elsif menu_selection == "Exit Movie Finder"
                exit
            end
    end

    def view_all_movies
        if !MovieUser.all.exists?(user: user)
            puts "You don't have any movies in your watchlist yet."
        else
            self.user.movies.each do |movie|
            puts movie.name
            end
        end
        menu
    end

    def select_genre
        prompt = TTY::Prompt.new
        selection = prompt.select("What genre are you most interested in right now?", ["Action", "Comedy", "Documentary", "Horror", "Go back to previous menu", "Exit Movie Finder"])
        if selection == "Go back to previous menu"
            menu
        elsif selection == "Action"
            action
        elsif selection == "Comedy"
            comedy
        elsif selection == "Documentary"
            documentary
        elsif selection == "Horror"
            horror
        elsif selection == "Exit Movie Finder"
            exit
        end
    end

    def action
        prompt = TTY::Prompt.new
        @movie_selection = prompt.select("Please select from the following movies:", ["Raiders of the Lost Ark", "Avengers: Infinity War", "Go back to previous menu", "Exit Movie Finder"])
        if @movie_selection == "Go back to previous menu"
            select_genre
        elsif @movie_selection == "Exit Movie Finder"
            exit
        else
            puts "You've selected #{@movie_selection}!"
            @movie_instance = Movie.all.find{|movie| movie.name == "#{@movie_selection}"}
        end
        movie_attributes(@movie_instance)
    end

    def comedy
        prompt = TTY::Prompt.new
        @movie_selection = prompt.select("Please select from the following movies:", ["Stepbrothers", "Get Smart", "Go back to previous menu", "Exit Movie Finder"])
        if @movie_selection == "Go back to previous menu"
            select_genre
        elsif @movie_selection == "Exit Movie Finder"
            exit
        else
            puts "You've selected #{@movie_selection}!"
            @movie_instance = Movie.all.find{|movie| movie.name == "#{@movie_selection}"}
        end
        movie_attributes(@movie_instance)
    end

    def documentary
        prompt = TTY::Prompt.new
        @movie_selection = prompt.select("Please select from the following movies:", ["Fyre", "Minimalism", "Go back to previous menu", "Exit Movie Finder"])
        if @movie_selection == "Go back to previous menu"
            select_genre
        elsif @movie_selection == "Exit Movie Finder"
            exit
        else
            puts "You've selected #{@movie_selection}!"
            @movie_instance = Movie.all.find{|movie| movie.name == "#{@movie_selection}"}
        end
        movie_attributes(@movie_instance)
    end

    def horror
        prompt = TTY::Prompt.new
        @movie_selection = prompt.select("Please select from the following movies:", ["The Conjuring", "Insidious", "Go back to previous menu", "Exit Movie Finder"])
        if @movie_selection == "Go back to previous menu"
            select_genre
        elsif @movie_selection == "Exit Movie Finder"
            exit
        else
            puts "You've selected #{@movie_selection}!"
            @movie_instance = Movie.all.find{|movie| movie.name == "#{@movie_selection}"}
        end
        movie_attributes(@movie_instance)
    end

    def get_attribute(attribute)
        Movie.all.find do |movie|
            if movie.name == "#{@movie_selection}"
                puts movie[attribute]
            end
        end
        movie_attributes(@movie_instance)
    end

    def movie_attributes(movie)
        prompt = TTY::Prompt.new
        movie_attribute = prompt.select("Choose to view specific info about this movie or add it to your watchlist:", ["Release year", "Cast", "MPA rating", "IMDB rating out of 10", "Add to watchlist", "Go back to previous menu", "Go to Main Menu", "Exit Movie Finder"])
        if movie_attribute == "Release year"
            get_attribute("year")
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Cast"
            get_attribute("cast")
            movie_attributes(@movie_instance)
        elsif movie_attribute == "MPA rating"
            get_attribute("rating")
            movie_attributes(@movie_instance)
        elsif movie_attribute == "IMDB rating out of 10"
            get_attribute("star_rating")
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Add to watchlist"
            add_to_watchlist
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Go to Main Menu"
            menu
        # elsif movie_attribute == "Go back to previous menu"
        #     if @selection == "Horror"
        #         horror
        #     elsif @selection == "Comedy"
        #         comedy 
        #     elsif @selection == "Documentary"
        #         documentary
        #     elsif @selection == "Horror"
        #         horror
        #     end
        elsif movie_attribute == "Exit Movie Finder"
            exit
        end
    end

    def add_to_watchlist
        if !user.movies.include?(@movie_instance)
            MovieUser.create(user: user, movie: @movie_instance)
            puts "This movie is now in your watchlist."
            # prompt = TTY::Prompt.new
            # yesorno = prompt.select("Would you like to return to the main menu or exit?", ["Main menu", "Exit"])
            #     if yesorno == "Main menu"
            #         menu
            #     else
            #         exit
            #     end
        else
            puts "This movie has already been added to your watchlist."
            movie_attributes(@movie_instance)
        end
    end

end
