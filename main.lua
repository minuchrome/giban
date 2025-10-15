Object = require("object")

require("camera")
require("input")
require("res")
require("sm")
require("utils")

require("objects.physics_object")
require("objects.player")
require("objects.wall")

function love.load()
    Res:init()
    SM:init("game")
end

function love.update(dt)
    dt = math.max(dt*60, 1.5)
    UpdateInputs()
    Camera:update(dt)
    SM:update(dt)
    ResetWheelInput()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
end