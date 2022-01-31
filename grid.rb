class Grid
	def initialize
		@robots = []
        @active_robot = nil
	end

    def start_program
        puts("=== BEGIN ===")
        exit = false
        while !exit
            puts ""
            
            # expecting string to be of form: "COMMAND PARAMETERS"
            input = gets.chomp.split(' ')
            command = input[0].downcase

            # if command has parameters (i.e. is either robot command or place command)
            if input.length > 1
                input[1] = input[1].split(',')
                parameters = input[1]
            end
             
            # these 4 commands require a robot to be selected first
            if ['move', 'report', 'left', 'right'].include?(command) && !@active_robot
                puts "ERROR: Select a robot first"
            else
                case command
                when 'place'
                    new_robot = Robot.new(parameters)
                    if new_robot.attributes_initialized
                        @robots.push(new_robot)
                    end
                # Expect form: "ROBOT 1"
                when 'robot'
                    robot_id = parameters[0].to_i
                    if @robots[robot_id - 1]
                        @active_robot = @robots[robot_id - 1]
                        puts "Robot #{@active_robot.id} selected."
                    else
                        puts 'ERROR: Robot not found.'
                    end
                when 'move' 
                    @active_robot.move
                when 'report'    
                    @active_robot.report
                when 'left'    
                    @active_robot.left
                when 'right'    
                    @active_robot.right
                when 'exit' 
                    exit = true
                else
                    puts "ERROR: Please enter a valid command.\n\n"
                end
            end
        end
    end
	
end