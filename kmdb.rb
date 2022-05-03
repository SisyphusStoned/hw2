# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne D
# Batman Begins          Michael Caine         Alfred D
# Batman Begins          Liam Neeson           Ra's Al Ghul D
# Batman Begins          Katie Holmes          Rachel Dawes D
# Batman Begins          Gary Oldman           Commissioner Gordon D
# The Dark Knight        Christian Bale        Bruce Wayne D
# The Dark Knight        Heath Ledger          Joker D
# The Dark Knight        Aaron Eckhart         Harvey Dent D
# The Dark Knight        Michael Caine         Alfred D
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes D
# The Dark Knight Rises  Christian Bale        Bruce Wayne D
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon D
# The Dark Knight Rises  Tom Hardy             Bane D
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake D
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Studio.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
studio1 = Studio.new
studio1["studio_name"] = "Warner Bros."
studio1.save

wbstudio = Studio.find_by({"studio_name" => "Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["release_year"] = 2005
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = wbstudio["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["release_year"] = 2008
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = wbstudio["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["release_year"] = 2012
movie["mpaa_rating"] = "PG-13"
movie["studio_id"] = wbstudio["id"]
movie.save

actor = Actor.new
actor["actor_name"]="Christian Bale"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
role["character_name"] = "Bruce Wayne"
role.save

actor = Actor.new
actor["actor_name"]="Michael Caine"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
role["character_name"] = "Alfred"
role.save

actor = Actor.new
actor["actor_name"]="Liam Neeson"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

actor = Actor.new
actor["actor_name"]="Katie Holmes"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
role["character_name"] = "Rachel Dawes"
role.save

actor = Actor.new
actor["actor_name"]="Gary Oldman"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "Batman Begins"})["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
role["character_name"] = "Commissioner Gordon"
role.save

actor = Actor.new
actor["actor_name"]="Heath Ledger"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
role["character_name"] = "Joker"
role.save

actor = Actor.new
actor["actor_name"]="Aaron Eckhart"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
role["character_name"] = "Harvey Dent"
role.save

actor = Actor.new
actor["actor_name"]="Maggie Gyllenhaal"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight"})["id"]
role["character_name"] = "Rachel Dawes"
role.save

actor = Actor.new
actor["actor_name"]="Tom Hardy"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
role["character_name"] = "Bane"
role.save

actor = Actor.new
actor["actor_name"]="Joseph Gordon-Levitt"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
role["character_name"] = "John Blake"
role.save

actor = Actor.new
actor["actor_name"]="Anne Hathaway"
actor.save

role = Role.new
role["actor_id"] = actor["id"]
role["movie_id"] = Movie.find_by({"title" => "The Dark Knight Rises"})["id"]
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

for movie in Movie.all
    if movie["title"].length > 20
        puts "#{movie["title"]}\t#{movie["release_year"]}\t#{movie["mpaa_rating"]}\t#{Studio.find_by({"id" =>"#{movie["studio_id"]}"})["studio_name"]}"
    else
        puts "#{movie["title"]}\t\t#{movie["release_year"]}\t#{movie["mpaa_rating"]}\t#{Studio.find_by({"id" =>"#{movie["studio_id"]}"})["studio_name"]}"
    end
end

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

for role in Role.all.order("movie_id")
    movie_title = Movie.find_by({"id" =>"#{role["movie_id"]}"})["title"]
    actor_name = Actor.find_by({"id" =>"#{role["actor_id"]}"})["actor_name"]
    if movie_title.length > 20
        if actor_name.length > 15
            puts "#{movie_title}\t#{actor_name}\t#{role["character_name"]}"
        else 
            puts "#{movie_title}\t#{actor_name}\t\t#{role["character_name"]}"
        end
    else
        if actor_name.length > 15
            puts "#{movie_title}\t\t#{actor_name}\t#{role["character_name"]}"
        else 
            puts "#{movie_title}\t\t#{actor_name}\t\t#{role["character_name"]}"
        end
    end
end
# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
