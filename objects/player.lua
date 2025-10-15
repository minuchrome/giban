Player = PhysicsObject:new()

local img = NewImage("player")

function Player:init(x, y, w, h)
    PhysicsObject.init(self)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
end

function Player:update(dt)
    
end