local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup{
    background_colour = "Normal",
    fps = 60,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO  = "",
        TRACE = "✎",
        WARN  = ""
    },
    minimum_width = 35,
    level   = 2,
    render  = "minimal",
    stages  = "fade",
    timeout = 50
}
