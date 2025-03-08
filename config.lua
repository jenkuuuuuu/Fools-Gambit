return {
    ["debug_mode"] = true
    --[[ 
    Fool's Gambit debug mode switch. Make sure it is on FALSE BEFORE committing to the github repo. Anything that isn't fully ready or planned for the current version should be inside an IF statement as such:

    if FG.config.debug_mode then
        {...} -- Your debug-only code here
    end
    
    ]]
}