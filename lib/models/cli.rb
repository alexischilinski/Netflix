class Cli
    attr_reader :user, :genre

    def start
        puts "Let us recommend a movie for you!"
        get_username
    end

    def create_username
        puts "Please choose a username:"
        user_name = gets.chomp
        if User.exists?(username: user_name)
            puts "Sorry that username has been taken."
            create_username
        else 
            @user.update_attributes(username: user_name)
        end       
    end

    def verify_username
        puts "Please enter your username:"
            if gets.chomp != User.find_by(name: @user_full_name).username
                puts "That username does not match our records."
                verify_username
            else
                puts "Welcome back, #{@first_name}!"
            end
    end

    def get_username
        puts "First, what is your full name?"
        @user_full_name = gets.chomp
        @first_name = @user_full_name.split(' ')[0]
            if !User.exists?(name: @user_full_name)
                @user = User.create(name: @user_full_name)
                puts "Welcome to our CLI!"
                    create_username
                puts "Thank you, #{@first_name}!"
            else
                verify_username
            end
            select_genre
        end

    def lister
        i = 1
        Genre.all.map do |genre|
            puts "#{i}. #{genre.name}"
            i += 1
        end
    end

    def select_genre
        puts "What genre are you most interested in right now? Pick a number from the following:"
        lister
        #genre = gets.chomp
            if genre == "1"
                action
            end
    end
#how to create a new column in user table to add room for new movie choice
    def action
        #pick a movie and be able to see rating, year, summary, lead actors
        puts "Please select from the following movies:"
        
    end

    def comedy
    end

    def documentary
    end

    def horror
    end
end
