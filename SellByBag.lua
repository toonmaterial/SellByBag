local function iter(container, slot)
	if not MerchantFrame:IsShown() then
		return
	end

	if slot > C_Container.GetContainerNumSlots(container) then
		return
	end

	if not C_Container.GetContainerItemInfo(container, slot) then
		return iter(container, slot + 1)
	end

	C_Container.UseContainerItem(container, slot)

	C_Timer.After(.1, function()
		iter(container, slot + 1)
	end)
end

for container = 0, 5 do
	local f = _G["ContainerFrame" .. container + 1]

	f.PortraitButton:HookScript("OnClick", function()
		if IsShiftKeyDown() then
			iter(container, 1)
		end
	end)
end
