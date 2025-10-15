require("stuff.object")
require("stuff.camera")
require("stuff.input")
require("stuff.res")
require("stuff.sm")
require("stuff.utils")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    
    local objects = love.filesystem.getDirectoryItems("objects")
    for _, object in ipairs(objects) do
        require("objects."..object:sub(1, #object-#".lua"))
    end
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