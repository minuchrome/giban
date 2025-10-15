Wall = Object:new()

function Wall:init(x, y)
    self.x = x
    self.y = y
    self.w = 10
    self.h = 100

    self.tags = {
        wall = true,
    }
end

function Wall:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end