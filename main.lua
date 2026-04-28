local get_path = ya.sync(function()
  local file = cx.active.current.hovered

  return tostring(file.url)
end)

return {
  entry = function(self, job)
    local path = get_path()

    local cat, cat_err = Command("cat"):arg(path):stdout(Command.PIPED):spawn()
    if not cat then
      return ya.notify {
        title = "Yank content",
        content = "Failed to read file: " .. tostring(cat_err),
        timeout = 3,
        level = "error",
      }
    end

    local copy, copy_err = Command("wl-copy"):stdin(cat:take_stdout()):spawn()
    if not copy then
      return ya.notify {
        title = "Yank content",
        content = "Failed to run wl-copy: " .. tostring(copy_err),
        timeout = 3,
        level = "error",
      }
    end

    local _, err = copy:wait()
    if err then
      return ya.notify {
        title = "Yank content",
        content = "Failed to copy to clipboard: " .. tostring(err),
        timeout = 3,
        level = "error",
      }
    end
  end,
}
