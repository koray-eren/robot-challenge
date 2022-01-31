class Robot
	attr_reader :id, :attributes_initialized
	
	@@robot_count = 0
	@@DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
	
	def self.robot_count
		@@robot_count
	end

	def initialize(parameters)
		x_location = parameters[0].to_i
		y_location = parameters[1].to_i
        direction = parameters[2].upcase
		
		@GRID_SIZE = 5
		@attributes_initialized = false

		if valid_robot_parameters?(x_location, y_location, direction)
			@location = [x_location, y_location]
			@direction = direction
			@@robot_count += 1
			@id = @@robot_count
			@attributes_initialized = true
		else
			puts "ERROR: Invalid place command."
		end
		
	end
	
    # returns true if 0 <= location < GRID_SIZE, false otherwise
    def valid_grid_location?(location)
        return location >= 0 && location < @GRID_SIZE
    end
    
    #parameters: parameters for place command - array of form [0, 0, "NORTH"]
    def valid_robot_parameters?(x_location, y_location, direction)
		valid_x_location = valid_grid_location?(x_location)
        valid_y_location = valid_grid_location?(y_location)
        return valid_x_location && valid_y_location && @@DIRECTIONS.include?(direction)
    end

	def move
		# format: [x_location, y_location]
		new_location = [@location[0], @location[1]]
		case @direction
		when 'NORTH'
			new_location[1] += 1
		when 'SOUTH'
			new_location[1] -= 1
		when 'EAST'
			new_location[0] += 1
		when 'WEST'
			new_location[0] -= 1
		end
		
		if valid_grid_location?(new_location[0]) && valid_grid_location?(new_location[1])
			@location = new_location
		else
			puts "ERROR: Robot cannot move off grid"
		end
	end

	def report
		puts "Robot #{@id} Report: #{@location[0]}, #{@location[1]}, #{@direction}"
	end
	
	def current_direction_index
		return @@DIRECTIONS.index(@direction)
	end

	def new_direction_index(number)
		new_index = current_direction_index() + number
		new_index = (new_index > 0 ? new_index % 4 : new_index % -4)
		return new_index
	end

	def left
		@direction = @@DIRECTIONS[new_direction_index(-1) ]
	end
	
	def right
		@direction = @@DIRECTIONS[new_direction_index(1) ]
	end
	
end