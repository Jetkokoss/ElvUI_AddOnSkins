local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

-- Raid Browser RU
-- https://github.com/fxpw/RaidBrowser-ru-for-sirus

if not AS:IsAddonLODorEnabled("RaidBrowserRU") then return end




S:AddCallbackForAddon("RaidBrowserRU", "RaidBrowserRU", function()

	if not E.private.addOnSkins.RaidBrowserRU then return end


	BARaidBrowserEditSpec:SetTemplate("Transparent")

	BARaidBrowserEditName:SetTemplate("Transparent")
	BARaidBrowserEditGearScore:SetTemplate("Transparent")
	BARaidBrowserEditName:Height(30)
	BARaidBrowserEditGearScore:Height(30)

	BARaidBrowserRaidSet:SetTemplate("Transparent")

	local dropdownArrowColor = {1, 0.8, 0}
	S:HandleNextPrevButton(BARaidBrowserRaidSetButton, "down", dropdownArrowColor)
	BARaidBrowserRaidSetButton:Size(25)

	S:HandleButton(RaidBrowserRaidSetSaveButton)
	S:HandleCloseButton(BARaidBrowserEditSpecCloseButton)
	S:HandleButton(BARaidBrowserEditSpecSaveButton)
	--S:HandleButton(BARaidBrowserEditCurrentSpecButton)
	BARaidBrowserEditNameEditBox:Height(20)
	BARaidBrowserEditGearScoreEditBox:Height(20)


	LFRBrowseFrameListScrollFrameScrollBar:HookScript("OnShow", function()
		S:HandleScrollBar(LFRBrowseFrameListScrollFrameScrollBar)
	end)

	LFRQueueFrame:HookScript("OnUpdate",function()
		for i = 1,6 do
			local chbx = _G["RBCheckButton"..i]
			if chbx then
				S:HandleCheckBox(chbx)
			end
		end
		local editboxes = {
			"RBTankEditBox",
			"RBDDEditBox",
			"RBHealEditBox",
			"RBAnrolText",
			"RBDInfoText"
		}
		for _,eb in ipairs(editboxes) do
			local edbox =  _G[eb]
			if edbox then
				S:HandleEditBox(edbox)
			end
		end
		local sliders = {
			"RBTankSlider",
			"RBDDSlider",
			"RBHealSlider",
			"RBILVLSlider",
			"RBSpamTimerSlider"
		}
		for _,slider in ipairs(sliders) do
			local sl =  _G[slider]
			if sl then
				S:HandleSliderFrame(sl)
			end
		end
		S:HandleButton(RBStartSpamButton)
		S:HandleButton(RBClearAllButton)
		S:HandleDropDownBox(RBNumRaidsDropDown)
	end)


end)
