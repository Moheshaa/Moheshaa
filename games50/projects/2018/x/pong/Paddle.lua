--[[
    
    -- Paddle Class --

    Represents a paddle that can move up and down. Used in the main
    program to deflect the ball back toward the opponent.
]]

Paddle = Class{}

--[[
    The `init` function on our class is called just once, when the object is first created. Used to set up all variables in the class and get it ready for use.

    Paddle should take an X and a Y, for positioning, as well as a width and height for its dimensions.

    Note that `self` is a reference to *this* object, whichever object is instantiated at the time this function is called. Different objects can have their own x, y, width, and height values, thus serving as containers for data. 

        --the colon allows object to call methods. i.e. if an object exists then it will use a function that works specifically on that object 
]]

function Paddle:init(x, y, width, height) 
    self.x = x          --self dot something means that it belongs to that object
    self.y = y
    self.width = width
    self.height = height

    self.dy = 0
end

function Paddle:update(dt)

    -- math.max here ensures that we're the greater of 0 or the player's current calculated Y position when pressing up so that we don't go into the negatives; the movement calculation is simply our previously-defined paddle speed scaled by dt

    if self.dy < 0 then
        self.y =math.max( 0, self.y + self.dy *dt)

        -- similar to before, this time we use math.min to ensure we don't go any farther than the bottom of the screen minus the paddle's height (or else it will go partially below, since position is based on its top left corner)
    
    elseif self.dy > 0 then
        self.y = math.min(VIRTUAL_HEIGHT-20, self.y + self.dy *dt)
    end
end
--this is the function for the computer paddle or AI paddle. the logic behinf this is that the paddle should always follow the y position of the ball in order to hit it every single time. So, the paddle is going to move when the velocity of ball is greater than 0. and the ball should be coming towards the paddle. 
function Paddle:Computer(ball)
    if ball.dy<0 then
        self.y=math.max(0, ball.y)
    else
        self.y=math.min(VIRTUAL_HEIGHT-self.height, ball.y)
    end
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
   
end