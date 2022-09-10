--[[
    Medal Class
    Author: Renan Lopes
]]

Medal = Class{}

function Medal:init()
    self.image = love.graphics.newImage('graphics/bronze.png')

    self.x =  VIRTUAL_WIDTH - 50
    self.y = 4
end

function Medal:update(score)
    if score > 10 then
        self.image = love.graphics.newImage('graphics/silver.png')
    end

    if score > 15 then
        self.image = love.graphics.newImage('graphics/gold.png')
    end


    if score > 25 then
        self.image = love.graphics.newImage('graphics/master.png')
    end
end

function Medal:render()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.2,0.2)
end