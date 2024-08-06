local Blocks = Blocks or require('Blocks.Blocks')
Grass = {}
Grass.Texture = love.graphics.newImage("Blocks/Grass.png")
Grass.id = 1
Grass.position = {
    x = 300,
    y = 400
}
Grass.load = function()
    Blocks.setBlock(Grass, 300, 400)
end
Grass.draw = function()
Blocks.drawBlock(Grass.Texture, 300, 400)
end
return Grass
