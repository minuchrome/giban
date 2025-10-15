Object = require("object")
require("sm")
require("utils")
require("objects.physics_object")
require("objects.player")

function love.load()
    SM:init("game")
end

function love.update(dt)
    dt = math.max(dt*60, 1.5)
    SM:update(dt)
end

function love.draw()
    SM:draw()
end