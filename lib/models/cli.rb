class Cli

    attr_accessor :user

    def initialize user=nil
        @user = user
    end

    def start
        font = TTY::Font.new(:starwars)
        pastel = Pastel.new
        puts "Welcome to..".colorize(:green)
        puts pastel.yellow(font.write("Movie Finder!"))
        sleep(2)
        get_username
    end

    def create_username
        puts "Please choose a username:".colorize(:light_blue)
        user_name = gets.chomp
        if User.exists?(username: user_name)
            puts "Sorry that username has been taken.".colorize(:light_blue)
            create_username
        else 
            user.update_attributes(username: user_name)
        end       
    end

    def verify_username
        puts "Please enter your username:".colorize(:light_blue)
        if gets.chomp != User.find_by(name: @user_full_name).username
            puts "That username does not match our records.".colorize(:light_blue)
            verify_username
        else
            self.user = User.find_by(name: @user_full_name)
            puts "Welcome back, #{@first_name}!".colorize(:light_blue)
            puts "Let us recommend a movie for you!".colorize(:light_blue)
        end
    end

    def get_username
        puts "First, what is your full name?".colorize(:light_blue)
        if @user_full_name = gets.chomp.downcase
              @first_name = @user_full_name.split(' ')[0]
                if !User.exists?(name: @user_full_name)
                    self.user = User.create(name: @user_full_name)
                    puts "Let us recommend a movie for you!".colorize(:light_blue)
                        create_username
                    puts "Thank you, #{@first_name}!".colorize(:light_blue)
                else
                    verify_username
                end
            end
            menu
        end

    def menu
        prompt = TTY::Prompt.new
        menu_selection = prompt.select("Choose what you'd like to do next:".colorize(:light_blue), ["Find a movie", "View my watchlist", "Delete movie from watchlist", "Exit Movie Finder"])
            if menu_selection == "Find a movie"
                select_genre
            elsif menu_selection == "View my watchlist"
                view_all_movies
            elsif menu_selection == "Delete movie from watchlist"
                delete_from_watchlist
                #menu
            elsif menu_selection == "Exit Movie Finder"
                exit
            end
    end

    def view_all_movies
        if !MovieUser.all.exists?(user: user)
            puts "You don't have any movies in your watchlist yet.".colorize(:light_blue)
        else
            self.user.reload
            self.user.movies.each do |movie|
            puts movie.name.colorize(:red)
            end
        end
        sleep(2)
        menu
    end

    def select_genre
        prompt = TTY::Prompt.new
        selection = prompt.select("What genre are you most interested in right now?".colorize(:light_blue), ["Action", "Comedy", "Documentary", "Horror", "Go back to previous menu", "Exit Movie Finder"])
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
        @movie_selection = prompt.select("Please select from the following movies:".colorize(:light_blue), ["Raiders of the Lost Ark", "Avengers: Infinity War", "Go back to previous menu", "Exit Movie Finder"])
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
        @movie_selection = prompt.select("Please select from the following movies:".colorize(:light_blue), ["Stepbrothers", "Get Smart", "Go back to previous menu", "Exit Movie Finder"])
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
        @movie_selection = prompt.select("Please select from the following movies:".colorize(:light_blue), ["Fyre", "Minimalism", "Go back to previous menu", "Exit Movie Finder"])
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
        @movie_selection = prompt.select("Please select from the following movies:".colorize(:light_blue), ["The Conjuring", "Insidious", "Go back to previous menu", "Exit Movie Finder"])
        if @movie_selection == "Go back to previous menu"
            select_genre
        elsif @movie_selection == "Exit Movie Finder"
            exit
        else
            puts "You've selected #{@movie_selection}!".colorize(:light_blue)
            @movie_instance = Movie.all.find{|movie| movie.name == "#{@movie_selection}"}
        end
        movie_attributes(@movie_instance)
    end

    def get_attribute(attribute)
        Movie.all.find do |movie|
            if movie.name == "#{@movie_selection}"
                puts movie[attribute].to_s.colorize(:yellow)
            end
        end
        movie_attributes(@movie_instance)
    end

    def movie_attributes(movie)
        prompt = TTY::Prompt.new
        movie_attribute = prompt.select("Choose to view specific info about #{@movie_selection} or add it to your watchlist:".colorize(:light_blue), ["Release year", "Cast", "MPA rating", "IMDB rating out of 10", "Add to watchlist", "Go back to previous menu", "Go to Main Menu", "Exit Movie Finder"])
        if movie_attribute == "Release year"
            get_attribute("year")
            sleep(1)
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Cast"
            get_attribute("cast")
            sleep(1)
            movie_attributes(@movie_instance)
        elsif movie_attribute == "MPA rating"
            get_attribute("rating")
            sleep(1)
            movie_attributes(@movie_instance)
        elsif movie_attribute == "IMDB rating out of 10"
            get_attribute("star_rating")
            sleep(1)
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Add to watchlist"
            add_to_watchlist
            movie_attributes(@movie_instance)
        elsif movie_attribute == "Go to Main Menu"
            menu
        elsif movie_attribute == "Go back to previous menu"
            if @movie_instance.genre.name == "Action"
                action
            elsif @movie_instance.genre.name == "Comedy"
                comedy 
            elsif @movie_instance.genre.name == "Documentary"
                documentary
            elsif @movie_instance.genre.name == "Horror"
                horror
            end
        elsif movie_attribute == "Exit Movie Finder"
            exit
        end
    end

    def the_office
        puts "Well, well, well. How the turntables.".colorize(:light_blue)
        sleep(2)
        exit
    end

    def add_to_watchlist
        if !user.movies.include?(@movie_instance)
            MovieUser.create(user: user, movie: @movie_instance)
            #MovieUser.update
            puts "This movie is now in your watchlist.".colorize(:light_blue)
            prompt = TTY::Prompt.new
            yesorno = prompt.select("Would you like to return to the main menu, view your watchlist, or exit?".colorize(:light_blue), ["Main menu", "View watchlist", "Exit"])
                if yesorno == "Main menu"
                    menu
                elsif yesorno == "View watchlist"
                    view_all_movies
                elsif yesorno == "Exit"
                    exit_method
                end
        else
            puts "This movie has already been added to your watchlist.".colorize(:light_blue)
            movie_attributes(@movie_instance)
        end
    end

    def delete_list 
        self.user.movies.map{|movie| "#{movie.name}"}
    end

    def delete_from_watchlist
        prompt = TTY::Prompt.new
        @delete_selection = prompt.select("Choose which movie you'd like to remove from your watchlist:".colorize(:light_blue), delete_list)
        @delete_instance = Movie.all.find{|movie| movie.name == @delete_selection}
        instance = MovieUser.where(user: user, movie: @delete_instance).ids
        MovieUser.destroy(instance)
        prompt = TTY::Prompt.new
        yesorno = prompt.select("Would you like to return to the main menu, view your watchlist, or exit?".colorize(:light_blue), ["Main menu", "View watchlist", "Exit"])
            if yesorno == "Main menu"
                menu
            elsif yesorno == "View watchlist"
                view_all_movies
            elsif yesorno == "Exit"
                exit_method
            end
        #view_all_movies.reload
        sleep(2)
        menu
    end

    def exit_method
        prompt = TTY::Prompt.new
        exit_selection = prompt.select("Are you sure you want to exit?".colorize(:light_blue), ["No, take me back to the main menu", "Yes, I'm going to watch one of the movies in my watchlist!", "Yes but screw this, I'm just gonna watch The Office"])
        if exit_selection == "No, take me back to the main menu" 
            menu
        elsif exit_selection == "Yes, I'm going to watch one of the movies in my watchlist!"
            exit
        elsif exit_selection == "Yes but screw this, I'm just gonna watch The Office"
            the_office
        end
    end

end
