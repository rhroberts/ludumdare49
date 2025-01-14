local peachy = require"3rd.peachy"
local scene = require"scene"
local music = require"audio.music"

local titleScene = scene:new("titleScene")

function titleScene:load()
    self.SpriteSheet = love.graphics.newImage("assets/ui/title_screen.png")
    self.SpriteSheetMeta = "assets/ui/title_screen.json"
    self.animation = peachy.new(self.SpriteSheetMeta, self.SpriteSheet, "Default")
    self.startInstructions = {
        text = "Press [enter] to start!",
        font = love.graphics.newFont("assets/fonts/pixeldroidMenuRegular.ttf", 24)
    }
    self.titleTheme = music:load("assets/audio/music/title_scene.ogg", "static")
end

function titleScene:update(dt, gameState)
    self.animation:update(dt)

    if not self.titleTheme:isPlaying() then
        self.titleTheme:play()
    end
    if love.keyboard.isDown("return") then
        if self.titleTheme:isPlaying() then
            self.titleTheme:stop()
        end
        gameState:setEnterPatientScene()
    end
end

function titleScene:draw(sx, sy)
    love.graphics.push()
    love.graphics.scale(sx, sy)
    self.animation:draw()
    love.graphics.pop()
    love.graphics.printf(
        {{0, 0, 0}, self.startInstructions.text},
        self.startInstructions.font,
        WindowWidth - 120,
        WindowHeight - 90, 5 * string.len(self.startInstructions.text),
        "center"
    )
end

return titleScene