local wf = wf or require "windfield"
Player = Player or require "Player.Player"
Blocks = Blocks or require('Blocks.Blocks')
world = wf.newWorld(0, 0, true)
world:setGravity(0, 1000)
--bgm = love.audio.newSource("Music/temp_bgm.ogg", "stream")
--love.audio.setVolume(0.31)
function love.load()
    world:addCollisionClass('Player')
    world:addCollisionClass('Platform')
    box = world:newRectangleCollider(400, 400, 50, 50)


    ground = world:newRectangleCollider(0, 550, 800, 50)
    wall_left = world:newRectangleCollider(0, 0, 50, 600)
    wall_right = world:newRectangleCollider(750, 0, 50, 600)
    ground:setType('static')
    ground:setCollisionClass('Platform')
    wall_left:setType('static')
    wall_right:setType('static')

    Player.load()
    Blocks.load()

   -- love.audio.play(bgm)

end

function love.update(dt)
    Player.update(dt)
    world:update(dt)
end

function love.draw()
    Blocks.draw()
    Player.Texture()
    world:draw()
end
