# Add a declarative step here for populating the DB with movies.
Tmdb::Api.key("e77aa7dc63d5ffbae94561b5de387e81")

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(title: movie[:title], rating: movie[:rating], release_date:movie[:release_date])
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # pending "Fill in this step in movie_steps.rb"

end

Then /(.*) seed movies should exist/ do | n_seeds |
  expect(Movie.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.

  page.body.index(e1).should < page.body.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if rating_list == "all"
    ratings = Movie.all_ratings
  else
    ratings = rating_list.split(",")
  end

  ratings.each { |rating|
    if uncheck
      uncheck(rating)
    else
      check(rating)
    end }


  # pending "Fill in this step in movie_steps.rb"
end

# Part 2, Step 3
Then /^I should (not )?see the following rating movies: (.*)$/ do |no, rating_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  # pending "Fill in this step in movie_steps.rb"
 

  if rating_list == "all" 
    filtered_ratings = Movie.all_ratings
  else
    filtered_ratings = rating_list.split(",")
  end

  title_to_check = []
  
  @movies = Movie.all
  @movies.each do |movie|
  if filtered_ratings.include?(movie.rating)
    title_to_check << movie.title
  end
end

  if not no
    # Expecting to see the titles
    title_to_check.each do |title|
      expect(page.body).to include(title)
    end
  else
    # Expecting not to see the titles
    title_to_check.each do |title|
      expect(page.body).not_to include(title)
    end
  end


end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  @movies = Movie.all
  @movies.each do |movie|
      page.body.include?(movie.title).should == true
  end  
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


# Then /complete the rest of of this scenario/ do
#   # This shows you what a basic cucumber scenario looks like.
#   # You should leave this block inside movie_steps, but replace
#   # the line in your scenarios with the appropriate steps.
#   fail "Remove this step from your .feature files"
# end
