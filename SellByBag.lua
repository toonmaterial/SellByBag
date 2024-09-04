local function iter(bag, slot)
	if not MerchantFrame:IsShown() then
		return
	end

	if slot > C_Container.GetContainerNumSlots(bag) then
		return
	end

	if not C_Container.GetContainerItemInfo(bag, slot) then
		return iter(bag, slot + 1)
	end

	C_Container.UseContainerItem(bag, slot)

	C_Timer.After(.1, function()
		iter(bag, slot + 1)
	end)
end

for i = 1, NUM_TOTAL_BAG_FRAMES do
	local bag = ContainerFrameContainer.ContainerFrames[i]

	bag.PortraitButton:HookScript("OnClick", function()
		if IsShiftKeyDown() then
			iter(bag:GetID(), 1)
		end
	end)
end
