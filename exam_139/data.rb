DATA = {test1: 1, test2: 2, test3: 3}

def update_data(select_string, &update) # you can update this line
  data = DATA.fetch(select_string)
  data.each(&update) # you can update or replace this line
  # save(data)
end

def update_by_type(type, &update) # you can update this method
  update_data(:test1, update)
end

def update_by_location(location, &update) # you can update this method
  update_data(:test2, update)
end

# Example calls - do not modify these lines
update_by_type(:test1) do |employee|
  puts employee *= 1.25
end

# update_by_location("Oregon") do |employee|
#   employee.salary *= 1.10
# end
