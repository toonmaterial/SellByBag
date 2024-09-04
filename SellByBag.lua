local function sell(container, slot)
	slot = slot or 1

	if slot > C_Container.GetContainerNumSlots(container) then
		return
	end

	C_Container.UseContainerItem(container, slot)

	C_Timer.NewTimer(.1, function()
		sell(container, slot + 1)
	end)
end

for container = 0, 5 do
	local f = _G["ContainerFrame" .. container + 1]

	f.PortraitButton:HookScript("OnClick", function()
		if MerchantFrame:IsShown() and IsShiftKeyDown() then
			sell(container)
		end
	end)
end
