require_relative "robot.rb"
require_relative "grid.rb"
# 5 x 5 grid
# [04, 14, 24, 34, 44]
# [03, 13, 23, 33, 43]
# [02, 12, 22, 32, 42]
# [01, 11, 21, 31, 41]
# [00, 10, 20, 30, 40]

# calculate next square (place or move)
# verify next square (is it on the grid)
# apply next square (if valid, move the robot)

# VARS
# facing = [NORTH, EAST, SOUTH, WEST]
# position = []

# puts("enter a command")
# input = gets.chomp.split(' ')

grid = Grid.new
grid.start_program