for container = 0, 5 do
	local f = _G["ContainerFrame" .. container + 1]

	f.PortraitButton:HookScript("OnClick", function()
		if MerchantFrame:IsShown() and IsShiftKeyDown() then
			for slot = 1, C_Container.GetContainerNumSlots(container) do
				C_Container.UseContainerItem(container, slot)
			end
		end
	end)
end
