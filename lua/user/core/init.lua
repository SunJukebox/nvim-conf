-- local M = {}
--
-- ---@class core: Core
-- ---@field options core.options
-- ---@field keymaps core.keymaps
-- ---@field autocmd core.autocmd
-- setmetatable(M, {
-- 	__index = function(t, k)
-- 		t[k] = require("user.core." .. k)
-- 		return t[k]
-- 	end,
-- })
--
-- return M
require("user.core.options")
require("user.core.keymaps")
require("user.core.autocmd")
