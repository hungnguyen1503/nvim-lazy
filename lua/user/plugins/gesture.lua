local status_ok, gesture = pcall(require, "gesture")
if not status_ok then
    return
end

local gestures = {
    {
        name = "scroll to bottom",
        inputs = { gesture.up(), gesture.down() },
        action = "normal! G",
    },
    {
        name = "next tab",
        inputs = { gesture.right() },
        action = "tabnext",
    }
}

-- Registering gestures
for _, gesture_config in ipairs(gestures) do
    gesture.register(gesture_config)
end
