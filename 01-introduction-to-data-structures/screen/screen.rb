require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = viable_demension(width)
    @height = viable_demension(height)
    @array = Array.new(@width){ Array.new(@height, nil) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    x, y = inbounds(x, y)
    @array[x][y] = pixel
  end

  def at(x, y)
    @array[x][y]
  end

  private

  def inbounds(x, y)
    #Keeps from going out of bounds of the matrix
    holder = []
    if x < 0
      holder << 0
    elsif x > @width
      holder << @width
    else
      holder << x
    end

    if y < 0
      holder << 0
    elsif y > @height 
      holder << @height
    else
      holder << y
    end

    return  holder[0], holder[1]

  end

  def viable_demension(dem)
    if dem < 0
      0  
    else
      dem
    end
  end

end