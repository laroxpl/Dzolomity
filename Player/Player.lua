local wf = wf or require "windfield"
Player = {}
dzolster = love.graphics.newImage("Player/my_temp_player.png")

local Dzolster = {
    x = 250,
    y = 400,
}

DrawDzolster = function(getX, getY, rotation, offset)
    love.graphics.draw(dzolster, getX, getY,0, rotation, 1, 0)
end
Player.load = function()
    my_player = world:newRectangleCollider(Dzolster.x, Dzolster.y, 32, 64)
    my_player:setFixedRotation(true)
    my_player:setCollisionClass('Player')

    my_player.rotation = 1
    my_player.facing_direction = "right"
    my_player.is_on_ground = false

    local function custom_collision(collider_1, collider_2, contact)
        if collider_1.collision_class == 'Player' and collider_2.collision_class == 'Platform' then
            my_player.is_on_ground = true
        end
    end
    my_player:setPreSolve(custom_collision)
end
Player.Texture = function()
    if my_player.facing_direction == "right" then
        my_player.rotation = 1
        DrawDzolster(my_player:getX() - 16, my_player:getY() - 32, my_player.rotation)
    end
    if my_player.facing_direction == "left" then
        my_player.rotation = -1
        DrawDzolster(my_player:getX() + 16, my_player:getY() - 32, my_player.rotation)
    end
end
Player.update = function(dt)
    my_player.is_on_ground = false
    dx, dy = my_player:getLinearVelocity()

    if love.keyboard.isDown('a') then
        my_player.facing_direction = "left"
        my_player:setLinearVelocity(-300, dy)
    end
    if love.keyboard.isDown('d') then
        my_player.facing_direction = "right"
        my_player:setLinearVelocity(300, dy)
    end
end
--poruszanie sie

function love.keyreleased(key)
    if key == 'd' or key == 'a' then
        dx, dy = my_player:getLinearVelocity()
        my_player:setLinearVelocity(0, dy)
    end
end

function love.keypressed(key)
    if key == 'space' and my_player.is_on_ground then
        my_player:applyLinearImpulse(0, -2000)
    end
end

return Player
