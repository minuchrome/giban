Player = PhysicsObject:new()

local img = NewImage("player")

function Player:init(x, y)
    PhysicsObject.init(self)
    self.x = x
    self.y = y
    self.w = img:getWidth()
    self.h = img:getHeight()

    self.tags = {
        player = true,
    }
end

function Player:update(dt)
    if Input.right.down then
        self:move_x(2*dt, "wall")
    end
    if Input.left.down then
        self:move_x(-2*dt, "wall")
    end
end

function Player:draw()
    love.graphics.draw(img, self.x, self.y)
end