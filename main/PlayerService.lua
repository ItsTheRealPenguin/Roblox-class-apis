--[[
    module
    * PlayerService
    
    made by
    * itspenguin.
    * last updated 05/01/24
]]
--// Services
local Players = game:GetService("Players")


--// Classes
local PlayerService = {}
PlayerService.__index = PlayerService


--// Initialize
function PlayerService.new()
    local self = setmetatable({}, PlayerService)

    self.Player = Players.LocalPlayer
    self.Character = self.Player.Character or self.Player.CharacterAdded:Wait()
    self.Humanoid = (self.Character and self.Character:WaitForChild("Humanoid"))

    self.UserId = self.Player.UserId
    self.AccountAge = self.Player.AccountAge

    return self
end
function PlayerService:Get()
    return self.new()
end


--// Player model methods
function PlayerService.fetchPlayerModel(self)
    self.Character = self.Character or self.Player.CharacterAdded:Wait()
    return self.Character
end
function PlayerService:GetCharacter(): Model
    return self:fetchPlayerModel()
end
function PlayerService:GetHumanoid(): Humanoid
    return self:GetCharacter():WaitForChild("Humanoid")
end
function PlayerService:LoadCharacter()
    self.Player:LoadCharacter()
end


--// Experience methods
function PlayerService:Quit()
    game:Shutdown()
end
function PlayerService:Kick(reason: string)
    self.Player:Kick(reason)
end


--// Player methods
function PlayerService:GetPlayer(): Player
    return self.Player
end
function PlayerService:GetId(): number
    return self.UserId
end
function PlayerService:GetAge(): number
    return self.AccountAge
end
function PlayerService:FakeAge(age: number)
    self.Player:SetAccountAge(age)
end
function PlayerService:GetMouse(): Mouse
    return self:GetPlayer():GetMouse()
end
function PlayerService:GetPlayerGui(): PlayerGui?
    return self:GetPlayer():WaitForChild("PlayerGui")
end


return PlayerService
