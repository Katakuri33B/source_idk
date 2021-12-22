local function ProgressBGPaint(s, w, h)
    surface.SetDrawColor(20, 20, 20, 150)
    surface.DrawRect(0, 0, w, h)
end 

function SetUpLoadingProgress()
    if IsValid(ProgressBG) then return end

    ProgressBG = vgui.Create("DPanel")
    ProgressBG:SetSize(300, 10)
    ProgressBG:SetPos(ScrW() / 2 - 150, 45)
    ProgressBG.Paint = ProgressBGPaint

    local progress = vgui.Create("DProgress", ProgressBG)
    progress:SetSize(ProgressBG:GetWide(), ProgressBG:GetTall())
    progress:SetPos(0, 0)
    if GetGlobalBool("ZyklusTag", true) and GetGlobalBool("ZyklusNacht", false) then
        progress:SetFraction(0)
        progress:SetFraction(Lerp(TAGNACHT.Tageszeit, 0, 1))
    elseif GetGlobalBool("ZyklusTag", false) and GetGlobalBool("ZyklusNacht", true) then
        progress:SetFraction(0)
        progress:SetFraction(Lerp(TAGNACHT.Nachtzeit, 0, 1))
    end
end 

hook.Add( "Initialize", "Progress", function()
	--SetUpLoadingProgress()
end )

concommand.Add("123", function()
    --SetUpLoadingProgress()
end)