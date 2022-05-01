if settings.startup["ru-Machine-liquid-Imput-Output"].value and not mods['omnimatter_fluid'] then
    --[[
        Do all the changes in data-final-fixes.lua, in case other mods have modified the assemblers
        1. Add "input throughput" pipes on N/S plane
        2. Add "output throughput" pipes on E/W plane
    ]]
    for j_index, j in pairs(data.raw['assembling-machine']) do
      if j.fluid_boxes and not appmod.blacklist[j.name] then
        log('Adding fluid boxes to ' .. j.name)
        for pipe_index, pipe in ipairs(j.fluid_boxes) do -- ipairs because array with a boolean on the end
          local connections_to_add = {}
          if pipe.production_type == 'input' then
            -- input pipe
            -- data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].production_type = 'input-output'
            -- pipes must be input or output
            for connection_index, connection in ipairs(pipe.pipe_connections) do
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].pipe_connections[connection_index].type = 'input-output'
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].base_level = -1
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].height = 2
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].base_area = 0.5
              table.insert(
                connections_to_add,
                {
                  position = {connection.position[1], connection.position[2] * -1},
                  type = 'input-output'
                }
              )
            end
          elseif pipe.production_type == 'output' then
            -- output pipe
            -- data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].production_type = 'input-output'
            -- pipes must be input or output
            for connection_index, connection in ipairs(pipe.pipe_connections) do
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].pipe_connections[connection_index].type = 'input-output'
              data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].pipe_connections[connection_index].position = {
                connection.position[2],
                connection.position[1]
              }
              table.insert(
                connections_to_add,
                {
                  position = {connection.position[1] * -1, connection.position[2]},
                  type = 'input-output'
                }
              )
            end
          else
            -- input/output pipe
            return
          end
          -- add the pipes.
          for _, to_add in pairs(connections_to_add) do
            table.insert(data.raw['assembling-machine'][j.name].fluid_boxes[pipe_index].pipe_connections, to_add)
          end
        end
      end
    end
  end