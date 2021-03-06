CriminalsManager = CriminalsManager or class()
function CriminalsManager:init()
	self._characters = {
		{
			taken = false,
			name = "american",
			unit = nil,
			peer_id = 0,
			static_data = {
				ssuffix = "d",
				voice = "rb2",
				mask_id = 1
			},
			data = {}
		},
		{
			taken = false,
			name = "german",
			unit = nil,
			peer_id = 0,
			static_data = {
				ssuffix = "c",
				voice = "rb3",
				mask_id = 2
			},
			data = {}
		},
		{
			taken = false,
			name = "russian",
			unit = nil,
			peer_id = 0,
			static_data = {
				ssuffix = "a",
				voice = "rb4",
				mask_id = 3
			},
			data = {}
		},
		{
			taken = false,
			name = "spanish",
			unit = nil,
			peer_id = 0,
			static_data = {
				ssuffix = "b",
				voice = "rb1",
				mask_id = 4
			},
			data = {}
		}
	}
end

function CriminalsManager:on_simulation_ended()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		self:_remove(id)
	end

end

function CriminalsManager:local_character_name()
	return self._local_character
end

function CriminalsManager:characters()
	return self._characters
end

function CriminalsManager:get_any_unit()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and alive(data.unit) and data.unit:id() ~= -1 then
			return data.unit
		end

	end

end

function CriminalsManager:_remove(id)
	local data = self._characters[id]
	if data.name == self._local_character then
		self._local_character = nil
	end

	print("[CriminalsManager] Remove character " .. data.name, data.unit)
	if data.unit then
		managers.hud:remove_mugshot_by_character_name(data.name)
	end

	data.taken = false
	data.unit = nil
	data.peer_id = 0
	data.data = {}
end

function CriminalsManager:add_character(name, unit, peer_id, ai)
	print("[CriminalsManager] Add character " .. name, unit)
	Application:stack_dump()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.name == name then
			if data.taken then
				Application:error("[CriminalsManager:set_character] Error: Trying to take a unit slot that has already been taken!")
				Application:stack_dump()
				Application:error("[CriminalsManager:set_character] -----")
				self:_remove(id)
			end

			data.taken = true
			data.unit = unit
			data.peer_id = peer_id or 0
			data.data.ai = ai or false
			local mask_set = Global.game_settings.single_player and managers.network:session():local_peer():mask_set() or not ai and managers.network:session():peer(peer_id):mask_set() or "clowns"
			local set = tweak_data.mask_sets[mask_set][data.static_data.mask_id]
			data.data.mask_obj = set.mask_obj
			data.data.mask_icon = set.mask_icon
			managers.hud:remove_mugshot_by_character_name(name)
			if unit then
				data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
				if unit:base().is_local_player then
					self._local_character = name
					managers.hud:reset_player_hpbar()
				end

				unit:sound():set_voice(data.static_data.voice)
				unit:inventory():set_mask_visibility(unit:inventory()._mask_visibility)
			else
				if not ai or not managers.localization:text("debug_" .. name) then
				end

				data.data.mugshot_id = managers.hud:add_mugshot_without_unit(name, ai, peer_id, (managers.network:session():peer(peer_id):name()))
			end

	end

	else
	end

end

function CriminalsManager:set_unit(name, unit)
	print("[CriminalsManager] Set unit " .. name, unit)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.name == name then
			if not data.taken then
				Application:error("[CriminalsManager:set_character] Error: Trying to set a unit on a slot that has not been taken!")
				Application:stack_dump()
				Application:error("[CriminalsManager:set_character] -----")
				return
			end

			data.unit = unit
			managers.hud:remove_mugshot_by_character_name(data.name)
			data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
			if unit:base().is_local_player then
				self._local_character = name
				managers.hud:reset_player_hpbar()
			end

			unit:sound():set_voice(data.static_data.voice)
	end

	else
	end

end

function CriminalsManager:is_taken(name)
	do
		local (for generator), (for state), (for control) = pairs(self._characters)
		do
			do break end
			if name == data.name then
				return data.taken
			end

		end

	end

	return false
end

function CriminalsManager:character_name_by_peer_id(peer_id)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and peer_id == data.peer_id then
			return data.name
		end

	end

end

function CriminalsManager:character_data_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and name == data.name then
			return data.data
		end

	end

end

function CriminalsManager:character_data_by_peer_id(peer_id)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and peer_id == data.peer_id then
			return data.data
		end

	end

end

function CriminalsManager:character_static_data_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if name == data.name then
			return data.static_data
		end

	end

end

function CriminalsManager:character_unit_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and name == data.name then
			return data.unit
		end

	end

end

function CriminalsManager:character_taken_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if name == data.name then
			return data.taken
		end

	end

end

function CriminalsManager:character_peer_id_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and name == data.name then
			return data.peer_id
		end

	end

end

function CriminalsManager:get_free_character_name()
	local available = {}
	do
		local (for generator), (for state), (for control) = pairs(self._characters)
		do
			do break end
			local taken = data.taken or managers.groupai:state():is_teamAI_marked_for_removal(data.name)
			if not taken then
				local (for generator), (for state), (for control) = pairs(managers.network:game():all_members())
				do
					do break end
					if member._assigned_name == data.name then
						taken = true
				end

				else
				end

			end

			if not taken then
				table.insert(available, data.name)
			end

		end

	end

	if #available > 0 then
		return available[math.random(1, #available)]
	end

end

function CriminalsManager:get_num_player_criminals()
	local num = 0
	do
		local (for generator), (for state), (for control) = pairs(self._characters)
		do
			do break end
			if data.taken and not data.ai then
				num = num + 1
			end

		end

	end

	return num
end

function CriminalsManager:remove_character_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return
	end

	local rem_u_key = unit:key()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.unit and data.taken and rem_u_key == data.unit:key() then
			self:_remove(id)
			return
		end

	end

end

function CriminalsManager:remove_character_by_peer_id(peer_id)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and peer_id == data.peer_id then
			self:_remove(id)
			return
		end

	end

end

function CriminalsManager:remove_character_by_name(name)
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.taken and name == data.name then
			self:_remove(id)
			return
		end

	end

end

function CriminalsManager:character_name_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return nil
	end

	local search_key = unit:key()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.name
		end

	end

end

function CriminalsManager:character_static_data_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return nil
	end

	local search_key = unit:key()
	local (for generator), (for state), (for control) = pairs(self._characters)
	do
		do break end
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.static_data
		end

	end

end

