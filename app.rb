require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/static_assets'
require 'sinatra/multi_route'
require './config/environments' #database configuration
current_dir = Dir.pwd           #models
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

# INDEX
get '/', '/index' do
  @image = 'cliffside_castle.jpg'
  erb :index
end


# DEPARTMENTS AND SO ON
get '/academics/?' do
  @title = 'Academics at ASF'
  @image = 'witches_three.jpg'
  erb :academics
end

# Academic resources
get '/resources/:page' do |page|
  @title = 'Academic Resources'
  @image = 'jolly_jugglers.jpg'
  # sanitize the file
  case page
  when 'online-learning'
    @title = 'Online Learning'
    @image = 'tightrope_walker.jpg'
    erb :'resources/online-learning'
  end
  halt 404
end

# Academic departments
get '/departments/:dept' do |dept|
  @dept = Department.find_by_page_address(dept)
  if @dept
    @image = @dept.header_image_name
    @title = @dept.name
    if dept == "riddles"
      @title = "Is this the Department of " + @title
    else
      @title = "Department of " + @title
    end
    erb :"/departments/#{@dept.page_address}"
  else
    halt 404
  end
end


# ADMISSIONS
get '/admissions/?' do
  @title = 'Admissions &amp; Aid'
  @image = 'hands_and_map.jpg'
  erb :admissions
end


# STUDENT LIFE
get '/student-life/?', '/studentlife/?', '/student_life/?' do
  @title = 'Life at ASF'
  @image = 'laughing_clifftop_guys.jpg'
  erb :student_life
end


# ABOUT
get '/about/?' do
  @title = 'About the Academy'
  @image = 'town_fairytale.jpg'
  erb :about
end

# STUFF FOR STUDENTS
get '/students/?' do
  @title = 'Student Portal'
  
  erb :things_for_students
end

# STUFF FOR FACULTY & STAFF
# GUILD
# VISITORS
get '/visitors/?' do
  @title = 'Information for Visitors'
  @image = 'town_rustic_colors.jpg'
  erb :visitors
end



# TESTING AND COURSES
get '/course_testing/?' do
  @title = 'Testing'
  erb :course_testing
end

post '/course_testing/?' do
  @title = 'Testing'
  course = Course.create(name: params[:name], number: params[:number], description: params[:description])
  codes = ""
  params[:departments].each do |dept|
    real_dept = Department.find_by_abbrev(dept)
    real_dept.courses << course
    codes << "#{real_dept.abbrev} #{params[:number]}, "
  end
  erb "New course: #{params[:name]} (#{codes})"
end

# ERRORS
error do
  @title = 'Error'
  erb 'We\'re experiencing technical difficulties. ' + env['sinatra.error'].message
end

# NOT FOUND
not_found do
  @title = 'Not found'
  @image = 'cobweb.jpg'
  erb "404: Page not found."
end
