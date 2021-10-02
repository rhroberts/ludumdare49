-- Full Medical Alchemist

-- In the criminal justice system, sexually based offenses are considered especially heinous.
-- In New York City, the dedicated detectives who investigate these vicious felonies are members 
-- of an elite squad known as the Special Victims Unit. 
-- These are their stories.

-- Load Modules / Libraries
local physicker = require"physicker"

-- Declare Global Parameters Here
WindowWidth = love.graphics.getWidth()
WindowHeight = love.graphics.getHeight()

-- Define Local Parameters Here

-- A primary callback of LÖVE that is called only once
function love.load()
    physicker:load()
end

-- A primary callback of LÖVE that is called continuously
function love.update(dt)
    physicker:update(dt)
end

-- A primary callback of LÖVE that is called continuously
function love.draw()
    physicker:draw()
end
