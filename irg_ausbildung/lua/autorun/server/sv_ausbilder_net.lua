util.AddNetworkString("AusbildungEEvent")

util.AddNetworkString("CTList")


net.Receive("CTList", function(len, ply)
    local pl = net.ReadEntity()

    function GAS.JobWhitelist:CanAccessJob(ply, job_index, _is_operator)
        if ply == pl then
            if job_index =="TEAM_CTPVT" then 
                return true
            end
        end
    end

    PrintMessage(HUD_PRINTTALK, pl:Name().." hat die Ausbildung bestanden")
end)