local M = {}
-- by default, windows doesnt remove the file, only closes the current buffer from where the command was triggered
-- in order to delete the file from the system this custom function will handle windows shell deletion
function M.del_buffer_win()
  -- get full path of the current buffer
  local filename = vim.fn.expand("%:p")

  -- check if the file exists
  if filename == "" or vim.bo.buftype ~= "" then
    vim.notify("No file to delete", vim.log.levels.WARN)
    return
  end

  -- ask for confirmation
  vim.ui.input({
    prompt = "Are you sure you want to delete this file?" .. filename .. "(y/n): ",
    default = "n",
  }, function(input)
    if input and input:lower() == "y" then
      -- close the buffer
      vim.cmd("bd!") -- buffer delete (force)

      -- delete the file using a shell command (for windows) using `del`
      local cmd = 'del /F /Q "' .. filename .. '"'
      vim.fn.system(cmd)
      vim.notify("File deleted: " .. filename, vim.log.levels.INFO)
    else
      vim.notify("File not deleted", vim.log.levels.INFO)
    end
  end)
end
return M
