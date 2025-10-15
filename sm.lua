SM = {}

function SM:init(name)
    self.scene = require("scenes."..name)
    self.scene:init()
end

function SM:update(dt)
    self.scene:update(dt)
end

function SM:draw()
    self.scene:draw() 
end