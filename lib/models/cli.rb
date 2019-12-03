class Cli
    attr_reader :user, :genre

    def welcome_message
        puts "Let us recommend a movie for you!"
        puts "What is your full name?"
        username = gets.chomp
        @user = User.create(name: username)
        puts "Okay, #{username}, what genre are you most interested in right now? Pick a number from the following:"
        puts "1. Action"
        puts "2. Comedy"
        puts "3. Documentary"
        puts "4. Horror"
        #genre = gets.chomp
            if genre == "1"
                action
            end
    end

    def action

    end

    def comedy
    end

    def documentary
    end

    def horror
    end
end