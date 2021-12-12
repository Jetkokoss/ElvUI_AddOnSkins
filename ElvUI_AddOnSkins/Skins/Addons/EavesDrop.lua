local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

if not AS:IsAddonLODorEnabled("EavesDrop") then return end

-- EavesDrop
--

S:AddCallbackForAddon("EavesDrop", "EavesDrop", function()
	if not E.private.addOnSkins.EavesDrop then return end

	EavesDropFrame:StripTextures()
	EavesDropFrame:CreateBackdrop("Transparent")
	EavesDropHistoryFrame:StripTextures()
	EavesDropHistoryFrame:CreateBackdrop("Transparent")
	--resetbutton
	S:HandleButton(EavesDropHistoryFrameReset)
	EavesDropHistoryFrameReset:SetText("Стереть")
	--tab butt
	S:HandleButton(EavesDropTab)
	EavesDropTab:Width(110)
	EavesDropTab:Height(40)
	EavesDropTab:ClearAllPoints()
	EavesDropTab:SetPoint("BOTTOM", EavesDropFrame, "TOP", 0, 0)

	--up and down butt
	local dropdownArrowColor = {1, 0.8, 0}
	S:HandleNextPrevButton(EavesDropFrameUpButton, "up", dropdownArrowColor)
	EavesDropFrameUpButton:Size(24)

	S:HandleNextPrevButton(EavesDropFrameDownButton, "down", dropdownArrowColor)
	EavesDropFrameDownButton:Size(24)

	S:HandleCloseButton(EavesDropHistoryFrameClose)
		--icons
	local texlist ={
		"EavesDropHistoryButtonNT",
		"EavesDropHistoryButtonPT",
		"EavesDropHistoryFrameOutgoingHitNT",
		"EavesDropHistoryFrameOutgoingHitPT",
		"EavesDropHistoryFrameOutgoingHealNT",
		"EavesDropHistoryFrameOutgoingHealPT",
		"EavesDropHistoryFrameIncomingHitNT",
		"EavesDropHistoryFrameIncomingHitPT",
		"EavesDropHistoryFrameIncomingHealNT",
		"EavesDropHistoryFrameIncomingHealPT",
	}
	for _,tex in ipairs(texlist)do
		local textc = _G[tex]
		if textc then
			textc:SetTexCoord(unpack(E.TexCoords))
		end
	end
	-- local f = EavesDropFrame
	-- f:SetResizable(true)
	-- f:SetMinResize(120, 160)
	-- f:SetMaxResize(460, 360)
	-- local sizer = CreateFrame("Button", "EDFSizer", f)
	-- sizer:SetHeight(16)
	-- sizer:SetWidth(16)
	-- sizer:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	-- sizer:SetScript(
	--   "OnMouseDown",
	--   function (self) self:GetParent():StartSizing("BOTTOMRIGHT") end)
	-- sizer:SetScript(
	--   "OnMouseUp", function (self) self:GetParent():StopMovingOrSizing() end)
  
	-- local line1 = sizer:CreateTexture(nil, "BACKGROUND")
	-- line1:SetWidth(14)
	-- line1:SetHeight(14)
	-- line1:SetPoint("BOTTOMRIGHT", 0, 0)
	-- line1:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
	-- local x = 0.1 * 14/17
	-- line1:SetTexCoord(0.05 - x, 0.5, 0.05, 0.5 + x, 0.05, 0.5 - x, 0.5 + x, 0.5)
  
	-- local line2 = sizer:CreateTexture(nil, "BACKGROUND")
	-- line2:SetWidth(8)
	-- line2:SetHeight(8)
	-- line2:SetPoint("BOTTOMRIGHT", 0, 0)
	-- line2:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
	-- local x = 0.1 * 8/17
	-- line2:SetTexCoord(0.05 - x, 0.5, 0.05, 0.5 + x, 0.05, 0.5 - x, 0.5 + x, 0.5)

end)