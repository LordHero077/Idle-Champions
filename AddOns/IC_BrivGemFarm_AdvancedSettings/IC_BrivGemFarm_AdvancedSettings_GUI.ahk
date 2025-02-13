; ############################################################
;                    Add tab to the GUI
; ############################################################
GUIFunctions.AddTab("BrivGF Advanced")

; ############################################################
;               Create the Gui of the tab here
; ############################################################
; Select the tab you created above
Gui, ICScriptHub:Tab, BrivGF Advanced

Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, Text, , BrivGemFarm Advanced Settings
Gui, ICScriptHub:Font, w400

;g_BrivUserSettings[ "ForceOfflineGemThreshold" ]
;g_BrivUserSettings[ "ForceOfflineRunThreshold" ]
;g_BrivUserSettings[ "BrivJumpBuffer" ]
;g_BrivUserSettings[ "DashWaitBuffer" ]
;g_BrivUserSettings[ "DoChestsContinuous" ]
;g_BrivUserSettings[ "HiddenFarmWindow" ]
;g_BrivUserSettings[ "ResetZoneBuffer" ]
;g_BrivUserSettings[ "RestoreLastWindowOnGameOpen" ]
;g_BrivUserSettings[ "WindowXPositon" ]
;g_BrivUserSettings[ "WindowYPositon" ]

Gui, ICScriptHub:Add, Checkbox, vOptionSettingCheck_DoChestsContinuous x15 y+5, DoChestsContinuous
Gui, ICScriptHub:Add, Checkbox, vOptionSettingCheck_HiddenFarmWindow x15 y+5, HiddenFarmWindow
Gui, ICScriptHub:Add, Checkbox, vOptionSettingCheck_RestoreLastWindowOnGameOpen x15 y+5, RestoreLastWindowOnGameOpen

GUIFunctions.UseThemeTextColor("InputBoxTextColor")

Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_ForceOfflineGemThreshold x15 y+5 w50, % g_BrivUserSettings[ "ForceOfflineGemThreshold" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_ForceOfflineRunThreshold x15 y+10 w50, % g_BrivUserSettings[ "ForceOfflineRunThreshold" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_BrivJumpBuffer x15 y+10 w50, % g_BrivUserSettings[ "BrivJumpBuffer" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_DashWaitBuffer x15 y+10 w50, % g_BrivUserSettings[ "DashWaitBuffer" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_ResetZoneBuffer x15 y+10 w50, % g_BrivUserSettings[ "ResetZoneBuffer" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_WindowXPositon x15 y+10 w50, % g_BrivUserSettings[ "WindowXPositon" ]
Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_WindowYPositon x15 y+10 w50, % g_BrivUserSettings[ "WindowYPositon" ]

GUIFunctions.UseThemeTextColor()

GuiControlGet, xyVal, ICScriptHub:Pos, OptionSettingEdit_ForceOfflineGemThreshold
xyValX += 55
xyValY += 5
Gui, ICScriptHub:Add, Text, x%xyValX% y%xyValY%+10 vOptionSettingText_ForceOfflineGemThreshold, ForceOfflineGemThreshold
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_ForceOfflineRunThreshold, ForceOfflineRunThreshold
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_BrivJumpBuffer, BrivJumpBuffer
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_DashWaitBuffer, DashWaitBuffer
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_ResetZoneBuffer, ResetZoneBuffer
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_WindowXPositon, WindowXPositon
Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_WindowYPositon, WindowyPositon

; ############ Preferred Briv Jump Zones #####################

GuiControlGet, xyVal, ICScriptHub:Pos, OptionSettingEdit_WindowYPositon
xyValY += 35
xyValX := 10

Gui, ICScriptHub:Font, w700
Gui, ICScriptHub:Add, Text, x10 y%xyValY% vOptionSettingText_TitlePreferredJump, Preferred Briv Jump Zones
Gui, ICScriptHub:Font, w400

IC_BrivGemFarm_AdvancedSettings_Functions.BuildModTables(xyValX+20, xyValY)
IC_BrivGemFarm_AdvancedSettings_Functions.LoadPreferredBrivJumpSettings()

; ############################################################

Gui, ICScriptHub:Add, Button , x10 y+10 gBrivGemFarmAdvancedSettingsSave, Save

IC_BrivGemFarm_AdvancedSettings_Component.AddToolTips()
IC_BrivGemFarm_AdvancedSettings_Component.Refresh()

; ############################################################
;                          Buttons
; ############################################################

BrivGemFarmAdvancedSettingsSave(){
    IC_BrivGemFarm_AdvancedSettings_Component.SaveAdvancedSettings()
}