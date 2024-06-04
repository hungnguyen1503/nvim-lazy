-- default values
require("spider").setup {
    skipInsignificantPunctuation = true,
    consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
    subwordMovement = true,
    customPatterns = {},            -- check "Custom Movement Patterns" in the README for details
}
