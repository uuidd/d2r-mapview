#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

readSettings(settingsFile, ByRef settings) {
    FileInstall, itemfilter.yaml, itemfilter.yaml , 0
    FileInstall, exocetblizzardot-medium.otf, exocetblizzardot-medium.otf , 1
    FileInstall, formal436bt-regular.otf, formal436bt-regular.otf , 1
    FileInstall, settings.ini, settings.ini, 0
    FileInstall, rustdecrypt.dll, rustdecrypt.dll, 1

    ; these are the default values
    settings := []
    settings["locale"] := ""
    settings["chosenVoice"] := 1
    settings["baseUrl"] := "http://localhost:3002"
    settings["alwaysShowMap"] := 0
    settings["hideTown"] := 0
    settings["serverScale"] := 3
    settings["alertedMapServerVersion"] := false

    settings["mapPosition"] := "CENTER"   ; can be "TOP_LEFT" or "TOP_RIGHT"
    settings["centerModeScale"] := 1.5
    settings["centerModeOpacity"] := 0.45
    settings["centerModeOffsetX"] := 0
    settings["centerModeOffsetY"] := 0
    settings["cornerModeScale"] := 1.130
    settings["cornerModeOpacity"] := 0.6
    settings["cornerModeOffsetX"] := 0
    settings["cornerModeOffsetY"] := 0


    settings["showGameHistory"] := 1
    settings["historyTextAlignment"] := "LEFT"
    settings["historyTextSize"] := "18"
    settings["showAllHistory"] := 0
    settings["showFPS"] := 0
    settings["showGameInfo"] := 0
    settings["gameInfoFontSize"] := "18"
    settings["gameInfoAlignment"] := "LEFT"
    settings["exitTextSize"] := "12"
    settings["showNumPlayers"] := 0

    settings["showPartyLocations"] := 1
    settings["showResists"] := 1
    settings["showHealthPc"] := 0
    settings["partyInfoFontSize"] := 0
    settings["resistFontSize"] := 0
    settings["healthFontSize"] := 0

    settings["showNormalMobs"] := 1
    settings["showUniqueMobs"] := 1
    settings["showBosses"] := 1
    settings["showDeadMobs"] := 1
    settings["showMerc"] := 1
    settings["showTownNPCs"] := 1
    settings["showTownNPCNames"] := 1
    settings["NPCsAsCross"] := 1
    
    settings["showImmunities"] := 1
    settings["showOtherPlayers"] := 1
    settings["showOtherPlayerNames"] := 0
    settings["showShrines"] := 1
    settings["showPortals"] := 1
    settings["showChests"] := 1
    settings["showPathFinding"] := 1
    settings["pathFindingColour"] := "FF0000"
    settings["lastActiveGUITab"] := "Info"
    settings["settingsUIX"] := 100
    settings["settingsUIY"] := 100
    
    settings["buffBarX"] := 0
    settings["buffBarY"] := 0
    settings["itemCounterX"] := 0
    settings["itemCounterY"] := 0

    settings["enableItemFilter"] := 1
    settings["itemFontSize"] := 12
    settings["itemLogFontSize"] := 18
    settings["itemLogEnabled"] := 1
    settings["itemCounterEnabled"] := 1
    settings["itemCounterSize"] := 75
    settings["showItemStats"] := 0
    settings["includeVendorItems"] := 1
    settings["buffBarEnabled"] := 1
    settings["buffBarIconSize"] := 50
    settings["buffBarVerticalOffset"] := 0

    settings["allowTextToSpeech"] := 1
    settings["textToSpeechVolume"] := 50
    settings["textToSpeechPitch"] := 4
    settings["textToSpeechSpeed"] := 1
    settings["allowItemDropSounds"] := 1

    settings["normalMobColor"] := "FFFFFF"
    settings["uniqueMobColor"] := "D4AF37"
    settings["championMobColor"] := "605cd8"
    settings["minionMobColor"] := "436f73"
    settings["bossColor"] := "FF0000"
    settings["mercColor"] := "436f73"
    settings["deadColor"] := "000000"
    settings["townNPCColor"] := "FFFFFF"
    
    settings["normalDotSize"] := "4"
    settings["normalImmunitySize"] := "7"
    settings["uniqueDotSize"] := "7"
    settings["uniqueImmunitySize"] := "14"
    settings["deadDotSize"] := "2"
    settings["bossDotSize"] := "5"
    settings["physicalImmuneColor"] := "CD853f"
    settings["magicImmuneColor"] := "ff8800"
    settings["fireImmuneColor"] := "FF0000"
    settings["lightImmuneColor"] := "FFFF00"
    settings["coldImmuneColor"] := "0000FF"
    settings["poisonImmuneColor"] := "32CD32"
    settings["portalColor"] := "00AAFF"
    settings["redPortalColor"] := "FF0000"
    settings["shrineColor"] := "FFD700"
    settings["shrineTextSize"] := "20"
    

    settings["showWaypointLine"] := 1
    settings["showNextExitLine"] := 1
    settings["showBossLine"] := 1
    settings["showQuestLine"] := 1
    

    settings["increaseMapSizeKey"] := "NumpadAdd"
    settings["decreaseMapSizeKey"] := "NumpadSub"
    settings["alwaysShowKey"] := "NumpadMult"
    settings["moveMapLeft"] := "#Left"
    settings["moveMapRight"] := "#Right"
    settings["moveMapUp"] := "#Up"
    settings["moveMapDown"] := "#Down"
    settings["switchMapMode"] := "~\"
    settings["historyToggleKey"] := "^g"
    settings["performanceMode"] := "-1"
    settings["enableD2ML"] := 0
    settings["windowTitle"] := "Diablo II: Resurrected"
    settings["debug"] := 0
    settings["fpscap"] := 60
    
    settings["showPlayerMissiles"] := 1
    settings["showEnemyMissiles"] := 1
    settings["missileOpacity"] := "0x77"
    settings["missileColorPhysicalMajor"] := "FFC2C2"
    settings["missileColorPhysicalMinor"] := "C99D9D"
    settings["missileFireMajorColor"] := "FF0000"
    settings["missileFireMinorColor"] := "C20000"
    settings["missileIceMajorColor"] := "00D0FF"
    settings["missileIceMinorColor"] := "00D0FF"
    settings["missileLightMajorColor"] := "FFFF00"
    settings["missileLightMinorColor"] := "A3A300"
    settings["missilePoisonMajorColor"] := "00FF00"
    settings["missilePoisonMinorColor"] := "009C00"
    settings["missileMagicMajorColor"] := "FF7300"
    settings["missileMagicMinorColor"] := "B35000"

    settings["missileMajorDotSize"] := "4"
    settings["missileMinorDotSize"] := "2"

    defaultSettings := settings.clone()

    ; read from the ini file and overwrite any of the above values
    IniRead, sectionNames, %settingsFile%
    Loop, Parse, sectionNames , `n
    {
        thisSection := A_LoopField
        IniRead, OutputVarSection, %settingsFile%, %thisSection%
        Loop, Parse, OutputVarSection , `n
        {
            valArr := StrSplit(A_LoopField,"=")
            valArr[1]
            if (valArr[2] == "true") {
                valArr[2] := true
            }
            if (valArr[2] == "false") {
                valArr[2] := false
            }
            settings[valArr[1]] := valArr[2]
        }
    }
    if (settings["enableD2ML"]) {
        gameWindowId := settings["windowTitle"]
    } else {
        gameWindowId := "ahk_exe D2R.exe"  ;default to normal window id
    }
    ; id window by PID
    WinGet, PID, PID, %gameWindowId%
    if (PID) {
        gameWindowID := "ahk_pid " . PID
    }
    settings["gameWindowId"] := gameWindowId

    baseUrl := settings["baseUrl"]
    StringRight, lastChar, baseUrl, 1
    if (lastChar=="/") {
        StringTrimRight, baseUrl, baseUrl, 1
        settings["baseUrl"] := baseUrl
    }

    WriteLog("Using configuration:")
    WriteLog("- baseUrl: " settings["baseUrl"])
    WriteLog("- performanceMode: " settings["performanceMode"])
    WriteLog("- gameWindowId: " settings["gameWindowId"])
    WriteLog("- debug logging: " settings["debug"])
    if (settings["enableD2ML"]) {
        WriteLog("- D2ML has been enabled! using gameWindowId " gameWindowId)
    }
    
    if FileExist(A_Scriptdir . "\mapconfig.ini") {
        WriteLog("Found existing mapconfig.ini")
    }
    WriteLog("Starting d2r-mapview...")

}