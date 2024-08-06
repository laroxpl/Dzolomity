Blocks = {}
Grass = Grass or require('Blocks.Grass')

Blocks.setBlock = function(block_name, x, y, size_x, size_y)
    block_name = world:newRectangleCollider(x, y, size_x or 50, size_y or 50)
    block_name:setCollisionClass("Platform")
    block_name:setType("static")
end
Blocks.drawBlock = function(drawable, x, y)
    love.graphics.draw(drawable, x, y, 0, 2.5, 2.5)
end

local load_all_tiles = function()
    Grass.load()
end
local draw_all_tiles = function()
    Grass.draw()
end
Blocks.load = function()
    load_all_tiles()
end
Blocks.draw = function()
    draw_all_tiles()
end
return Blocks
