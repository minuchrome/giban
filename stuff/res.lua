local scale = 2

Res = {}
Res.w = WINDOW_W/scale
Res.h = WINDOW_H/scale
Res.shift = {x = 0, y = 0}
Res.q = {}

function Res:pass(callback)
    table.insert(self.q, callback)
end

function Res:init()
    local w, h = love.graphics.getDimensions()
    self:resize(w, h)
    self.canvas = love.graphics.newCanvas(self.w, self.h, {
        -- format = "rgba16f" -- lovejs color rounding fix
    })
end

function Res:before()
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
    self.q = {}
end

function Res:after()
    love.graphics.setCanvas()
    love.graphics.draw(self.canvas, self.shift.x, self.shift.y, 0, self.zoom, self.zoom)

    love.graphics.push()
    love.graphics.translate(self.shift.x, self.shift.y)
    love.graphics.scale(self.zoom/scale, self.zoom/scale)
    for _, callback in ipairs(self.q) do
        callback()
    end
    love.graphics.pop()
end

function Res:getX()
    return (love.mouse.getX()-self.shift.x)/self.zoom
end

function Res:getY()
    return (love.mouse.getY()-self.shift.y)/self.zoom
end

function Res:resize(w, h)
    if self.w-w > self.h-h then
        self.zoom = w/self.w
        self.shift.x = 0
        self.shift.y = h/2-Res.h*Res.zoom/2
    else
        self.zoom = h/self.h
        self.shift.x = w/2-Res.w*Res.zoom/2
        self.shift.y = 0
    end
end

function love.resize(w, h)
    Res:resize(w, h)
end