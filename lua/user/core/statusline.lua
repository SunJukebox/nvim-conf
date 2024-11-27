local modes = setmetatable({
  ["n"] = {"Normal", "N"}
  ["no"] = {"N-Operator"}
})

local function getcurrmode()
  local mode = modes[vim.api.nvim_get_mode().mode]
end

function statusline()
  return table.concat({
    getcurrmode()
  })
end
