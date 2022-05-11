--[[
    GD50 2018
    Pong Remake

    -- Ball Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Represents a ball which will bounce back and forth between paddles
    and walls until it passes a left or right boundary of the screen,
    scoring a point for the opponent.
]]

Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x 
    self.y = y
    self.width = width
    self.height = height
    self.dx = math.random(2) == 1 and -100 or 100 
    self.dy = math.random(-50, 50)

end


--[[
    Expects a paddle(box) as an argument and returns true or false, depending on whether their rectangles overlap.
]]

function Ball:collides(box)

    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other

    if self.x > box.x + box.width or self.x + self.width < box.x then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > box.y + box.height or self.y + self.height < box.y then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true
end

function Ball:reset()
     -- start ball's position in the middle of the screen
     self.x = VIRTUAL_WIDTH / 2 - 2
     self.y = VIRTUAL_HEIGHT / 2 - 2

     -- given ball's x and y velocity a random starting value
     -- the and/or pattern here is Lua's way of accomplishing a ternary operation
     -- in other programming languages like C
     self.dx = math.random(2) == 1 and 100 or -100
     self.dy = math.random(-50, 50) * 1.5
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end


function Ball:render()

        --ball
        love.graphics.rectangle('fill', self.x, self.y, 4, 4)

end





