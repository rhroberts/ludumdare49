Scene = require "scene"

local sti = require "3rd/sti/sti"
local physicker = require"physicker"
local frog = require"frog"
local cat = require"cat"
local patient = require"patient"
local textbox = require"textbox"

local navigation_scene = Scene:new("navigation")

function navigation_scene:load()
    -- Load map file
    Map = sti("assets/map/map_test.lua", {"box2d"})
    World = love.physics.newWorld(0, 0)
    World:setCallbacks(BeginContact, EndContact)
    Map:box2d_init(World)
    Map.layers.Walls.visible = false

    physicker:load()
    frog:load()
    cat:load()
    -- Randomize patients
    local P = {1, 2, 3, 4}
    for i = 1, #P - 1 do
        local j = math.random(i, #P)
        P[i], P[j] = P[j], P[i]
    end
    p1 = patient:new(P[1], 1, 0)
    p2 = patient:new(P[2], 2, 3)
    p3 = patient:new(P[3], 3, 6)
    p4 = patient:new(P[4], 4, 9)
    p1:load()
    p2:load()
    p3:load()
    p4:load()

    -- add an example text box
    Greeting = textbox(
        "Move around, bro! Work the room. Explore this beautiful world."
    )
    Greeting.load()
    -- tunez
    NavTheme = love.audio.newSource("assets/audio/music/navigation_scene.ogg", "static")
end
  

function navigation_scene:update(dt, gamestate)
    World:update(dt)
    physicker:update(dt)
    frog:update(dt)
    cat:update(dt)
    p1:update(dt)
    p2:update(dt)
    p3:update(dt)
    p4:update(dt)
    if love.keyboard.isDown("e") then
        gamestate:setAlchemyScene()
    end
    if not NavTheme:isPlaying() then
        NavTheme:play()
    end
    Greeting.update(dt)
end

function navigation_scene:draw(sx, sy)
    love.graphics.push()
    love.graphics.scale(sx, sy)
    Map:draw(0, 0, sx, sy)
    physicker:draw()
    frog:draw()
    cat:draw()
    p1:draw()
    p2:draw()
    p3:draw()
    p4:draw()
    love.graphics.pop()
    Greeting.draw()
end

function BeginContact(a, b, collision)
    physicker:beginContact(a, b, collision)
    frog:beginContact(a, b, collision)
    cat:beginContact(a, b, collision)
end

function EndContact(a, b, collision)
    physicker:endContact(a, b, collision)
    frog:endContact(a, b, collision)
    cat:endContact(a, b, collision)
end

return navigation_scene
