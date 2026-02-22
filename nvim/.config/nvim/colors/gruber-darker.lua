--   Original Emacs theme:
--   Copyright (C) 2013-2016 Alexey Kutepov a.k.a rexim
--   Copyright (C) 2009-2010 Jason R. Blevins
--   URL: http://github.com/rexim/gruber-darker-theme

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gruber-darker"

-- Palette
local c = {
  fg        = "#e4e4ef",
  fg1       = "#f4f4ff",
  fg2       = "#f5f5f5",
  white     = "#ffffff",
  black     = "#000000",
  bg_1      = "#101010",
  bg        = "#181818",
  bg1       = "#282828",
  bg2       = "#453d41",
  bg3       = "#484848",
  bg4       = "#52494e",
  red_1     = "#c73c3f",
  red       = "#f43841",
  red1      = "#ff4f58",
  green     = "#73c936",
  yellow    = "#ffdd33",
  brown     = "#cc8c3c",
  quartz    = "#95a99f",
  niagara_2 = "#303540",
  niagara_1 = "#565f73",
  niagara   = "#96a6c8",
  wisteria  = "#9e95c7",
  none      = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ============================================================================
-- Editor UI
-- ============================================================================

hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalNC", { fg = c.fg, bg = c.bg })
hi("NormalSB", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg })
hi("FloatBorder", { fg = c.bg4, bg = c.bg1 })
hi("FloatTitle", { fg = c.yellow, bg = c.bg1, bold = true })
hi("Cursor", { fg = c.black, bg = c.yellow })
hi("lCursor", { fg = c.black, bg = c.yellow })
hi("CursorIM", { fg = c.black, bg = c.yellow })
hi("TermCursor", { fg = c.black, bg = c.yellow })
hi("CursorLine", {})
hi("CursorColumn", { bg = c.bg1 })
hi("ColorColumn", { bg = c.bg1 })
hi("Visual", { bg = c.bg3 })
hi("VisualNOS", { bg = c.bg3 })

hi("LineNr", { fg = c.bg4 })
hi("CursorLineNr", { fg = c.yellow, bold = true })
hi("SignColumn", { fg = c.bg4, bg = c.none })
hi("FoldColumn", { fg = c.bg4, bg = c.none })
hi("Folded", { fg = c.niagara_1, bg = c.bg1 })

hi("VertSplit", { fg = c.bg2 })
hi("WinSeparator", { fg = c.bg2 })

hi("StatusLine", { fg = c.white, bg = c.bg1 })
hi("StatusLineNC", { fg = c.quartz, bg = c.bg1 })
hi("WinBar", { fg = c.fg, bg = c.bg })
hi("WinBarNC", { fg = c.quartz, bg = c.bg })

hi("TabLine", { fg = c.bg4, bg = c.bg1 })
hi("TabLineFill", { bg = c.bg1 })
hi("TabLineSel", { fg = c.yellow, bg = c.none, bold = true })

hi("Pmenu", { fg = c.fg, bg = c.bg1 })
hi("PmenuSel", { fg = c.fg, bg = c.bg_1 })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.bg_1 })

hi("Search", { fg = c.black, bg = c.fg2 })
hi("IncSearch", { fg = c.black, bg = c.fg2 })
hi("CurSearch", { fg = c.black, bg = c.yellow })
hi("Substitute", { fg = c.black, bg = c.yellow })

hi("MatchParen", { bg = c.bg4 })

hi("ModeMsg", { fg = c.fg, bold = true })
hi("MsgArea", { fg = c.fg })
hi("MoreMsg", { fg = c.green })
hi("Question", { fg = c.green })
hi("WarningMsg", { fg = c.red })
hi("ErrorMsg", { fg = c.black, bg = c.red })

hi("NonText", { fg = c.bg3 })
hi("SpecialKey", { fg = c.bg3 })
hi("Whitespace", { fg = c.bg1 })
hi("EndOfBuffer", { fg = c.bg3 })

hi("Directory", { fg = c.niagara, bold = true })
hi("Title", { fg = c.yellow, bold = true })
hi("Conceal", { fg = c.niagara_1 })
hi("SpellBad", { undercurl = true, sp = c.red })
hi("SpellCap", { undercurl = true, sp = c.yellow })
hi("SpellRare", { undercurl = true, sp = c.wisteria })
hi("SpellLocal", { undercurl = true, sp = c.green })
hi("WildMenu", { fg = c.black, bg = c.yellow })
hi("QuickFixLine", { bg = c.bg1, bold = true })

-- ============================================================================
-- Diff
-- ============================================================================

hi("DiffAdd", { fg = c.green, bg = c.none })
hi("DiffChange", { fg = c.yellow, bg = c.none })
hi("DiffDelete", { fg = c.red1, bg = c.none })
hi("DiffText", { fg = c.yellow, bg = c.bg2 })
hi("diffAdded", { fg = c.green })
hi("diffRemoved", { fg = c.red1 })
hi("diffChanged", { fg = c.yellow })
hi("diffFile", { fg = c.wisteria })
hi("diffOldFile", { fg = c.red })
hi("diffNewFile", { fg = c.green })
hi("diffLine", { fg = c.niagara })

-- ============================================================================
-- Syntax (standard Vim groups)
-- ============================================================================

hi("Comment", { fg = c.brown, italic = true })
hi("Constant", { fg = c.quartz })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.wisteria })
hi("Boolean", { fg = c.yellow, bold = true })
hi("Float", { fg = c.wisteria })

hi("Identifier", { fg = c.fg1 })
hi("Function", { fg = c.niagara })

hi("Statement", { fg = c.yellow, bold = true })
hi("Conditional", { fg = c.yellow, bold = true })
hi("Repeat", { fg = c.yellow, bold = true })
hi("Label", { fg = c.yellow, bold = true })
hi("Operator", { fg = c.fg })
hi("Keyword", { fg = c.yellow, bold = true })
hi("Exception", { fg = c.yellow, bold = true })

hi("PreProc", { fg = c.quartz })
hi("Include", { fg = c.quartz })
hi("Define", { fg = c.quartz })
hi("Macro", { fg = c.quartz })
hi("PreCondit", { fg = c.quartz })

hi("Type", { fg = c.quartz })
hi("StorageClass", { fg = c.yellow, bold = true })
hi("Structure", { fg = c.quartz })
hi("Typedef", { fg = c.quartz })

hi("Special", { fg = c.yellow })
hi("SpecialChar", { fg = c.yellow })
hi("Tag", { fg = c.yellow })
hi("Delimiter", { fg = c.fg })
hi("SpecialComment", { fg = c.green, italic = true })
hi("Debug", { fg = c.red })

hi("Underlined", { fg = c.niagara, underline = true })
hi("Ignore", { fg = c.bg3 })
hi("Error", { fg = c.white, bg = c.red })
hi("Todo", { fg = c.yellow, bg = c.none, bold = true })

-- ============================================================================
-- Treesitter
-- ============================================================================

hi("@variable", { fg = c.fg1 })
hi("@variable.builtin", { fg = c.niagara })
hi("@variable.parameter", { fg = c.fg1 })
hi("@variable.member", { fg = c.fg1 })

hi("@constant", { fg = c.quartz })
hi("@constant.builtin", { fg = c.quartz })
hi("@constant.macro", { fg = c.quartz })

hi("@module", { fg = c.niagara })
hi("@label", { fg = c.yellow })

hi("@string", { fg = c.green })
hi("@string.documentation", { fg = c.green })
hi("@string.escape", { fg = c.yellow })
hi("@string.regexp", { fg = c.green })

hi("@character", { fg = c.green })
hi("@number", { fg = c.wisteria })
hi("@number.float", { fg = c.wisteria })
hi("@boolean", { fg = c.yellow, bold = true })

hi("@type", { fg = c.quartz })
hi("@type.builtin", { fg = c.quartz })
hi("@type.definition", { fg = c.quartz })
hi("@type.qualifier", { fg = c.yellow, bold = true })

hi("@attribute", { fg = c.quartz })
hi("@property", { fg = c.fg1 })

hi("@function", { fg = c.niagara })
hi("@function.builtin", { fg = c.yellow })
hi("@function.macro", { fg = c.quartz })
hi("@function.method", { fg = c.niagara })

hi("@constructor", { fg = c.niagara })

hi("@keyword", { fg = c.yellow, bold = true })
hi("@keyword.function", { fg = c.yellow, bold = true })
hi("@keyword.operator", { fg = c.yellow })
hi("@keyword.import", { fg = c.quartz })
hi("@keyword.return", { fg = c.yellow, bold = true })
hi("@keyword.exception", { fg = c.yellow, bold = true })
hi("@keyword.conditional", { fg = c.yellow, bold = true })
hi("@keyword.repeat", { fg = c.yellow, bold = true })
hi("@keyword.directive", { fg = c.quartz })

hi("@operator", { fg = c.fg })

hi("@punctuation.delimiter", { fg = c.fg })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.special", { fg = c.yellow })

hi("@comment", { fg = c.brown, italic = true })
hi("@comment.documentation", { fg = c.green, italic = true })
hi("@comment.error", { fg = c.red, bold = true })
hi("@comment.warning", { fg = c.yellow, bold = true })
hi("@comment.todo", { fg = c.yellow, bold = true })
hi("@comment.note", { fg = c.niagara, bold = true })

hi("@markup.heading", { fg = c.yellow, bold = true })
hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline", { underline = true })
hi("@markup.link", { fg = c.niagara, underline = true })
hi("@markup.link.url", { fg = c.niagara, underline = true })
hi("@markup.raw", { fg = c.green })
hi("@markup.list", { fg = c.yellow })

hi("@tag", { fg = c.yellow })
hi("@tag.attribute", { fg = c.niagara })
hi("@tag.delimiter", { fg = c.fg })

-- ============================================================================
-- LSP Semantic Tokens
-- ============================================================================

hi("@lsp.type.class", { fg = c.quartz })
hi("@lsp.type.decorator", { fg = c.quartz })
hi("@lsp.type.enum", { fg = c.quartz })
hi("@lsp.type.enumMember", { fg = c.quartz })
hi("@lsp.type.function", { fg = c.niagara })
hi("@lsp.type.interface", { fg = c.quartz })
hi("@lsp.type.macro", { fg = c.quartz })
hi("@lsp.type.method", { fg = c.niagara })
hi("@lsp.type.namespace", { fg = c.niagara })
hi("@lsp.type.parameter", { fg = c.fg1 })
hi("@lsp.type.property", { fg = c.fg1 })
hi("@lsp.type.struct", { fg = c.quartz })
hi("@lsp.type.type", { fg = c.quartz })
hi("@lsp.type.typeParameter", { fg = c.quartz })
hi("@lsp.type.variable", { fg = c.fg1 })

-- ============================================================================
-- Diagnostics
-- ============================================================================

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.niagara })
hi("DiagnosticHint", { fg = c.green })
hi("DiagnosticOk", { fg = c.green })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.niagara })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.green })
hi("DiagnosticUnderlineOk", { undercurl = true, sp = c.green })

hi("DiagnosticVirtualTextError", { fg = c.red_1, bg = c.none })
hi("DiagnosticVirtualTextWarn", { fg = c.brown, bg = c.none })
hi("DiagnosticVirtualTextInfo", { fg = c.niagara_1, bg = c.none })
hi("DiagnosticVirtualTextHint", { fg = c.quartz, bg = c.none })

hi("DiagnosticFloatingError", { fg = c.red })
hi("DiagnosticFloatingWarn", { fg = c.yellow })
hi("DiagnosticFloatingInfo", { fg = c.niagara })
hi("DiagnosticFloatingHint", { fg = c.green })

hi("DiagnosticSignError", { fg = c.red })
hi("DiagnosticSignWarn", { fg = c.yellow })
hi("DiagnosticSignInfo", { fg = c.niagara })
hi("DiagnosticSignHint", { fg = c.green })

-- ============================================================================
-- Git Signs / Gutter
-- ============================================================================

hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })
hi("GitSignsCurrentLineBlame", { fg = c.bg4, italic = true })


-- ============================================================================
-- nvim-cmp
-- ============================================================================

hi("CmpItemAbbr", { fg = c.fg })
hi("CmpItemAbbrDeprecated", { fg = c.bg4, strikethrough = true })
hi("CmpItemAbbrMatch", { fg = c.green, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.green })
hi("CmpItemKind", { fg = c.niagara })
hi("CmpItemMenu", { fg = c.brown })

hi("CmpItemKindText", { fg = c.fg })
hi("CmpItemKindMethod", { fg = c.niagara })
hi("CmpItemKindFunction", { fg = c.niagara })
hi("CmpItemKindConstructor", { fg = c.niagara })
hi("CmpItemKindField", { fg = c.fg1 })
hi("CmpItemKindVariable", { fg = c.fg1 })
hi("CmpItemKindClass", { fg = c.quartz })
hi("CmpItemKindInterface", { fg = c.quartz })
hi("CmpItemKindModule", { fg = c.niagara })
hi("CmpItemKindProperty", { fg = c.fg1 })
hi("CmpItemKindUnit", { fg = c.wisteria })
hi("CmpItemKindValue", { fg = c.wisteria })
hi("CmpItemKindEnum", { fg = c.quartz })
hi("CmpItemKindKeyword", { fg = c.yellow })
hi("CmpItemKindSnippet", { fg = c.green })
hi("CmpItemKindColor", { fg = c.green })
hi("CmpItemKindFile", { fg = c.fg })
hi("CmpItemKindReference", { fg = c.wisteria })
hi("CmpItemKindFolder", { fg = c.niagara })
hi("CmpItemKindEnumMember", { fg = c.quartz })
hi("CmpItemKindConstant", { fg = c.quartz })
hi("CmpItemKindStruct", { fg = c.quartz })
hi("CmpItemKindEvent", { fg = c.yellow })
hi("CmpItemKindOperator", { fg = c.fg })
hi("CmpItemKindTypeParameter", { fg = c.quartz })

-- ============================================================================
-- NvimTree / Oil / File Explorers
-- ============================================================================

hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
hi("NvimTreeNormalNC", { fg = c.fg, bg = c.bg })
hi("NvimTreeRootFolder", { fg = c.yellow, bold = true })
hi("NvimTreeFolderName", { fg = c.niagara, bold = true })
hi("NvimTreeFolderIcon", { fg = c.niagara })
hi("NvimTreeOpenedFolderName", { fg = c.niagara, bold = true })
hi("NvimTreeEmptyFolderName", { fg = c.niagara_1 })
hi("NvimTreeSpecialFile", { fg = c.yellow })
hi("NvimTreeIndentMarker", { fg = c.bg3 })
hi("NvimTreeGitDirty", { fg = c.brown })
hi("NvimTreeGitNew", { fg = c.green })
hi("NvimTreeGitDeleted", { fg = c.red })
hi("NvimTreeGitStaged", { fg = c.green })

hi("OilDir", { fg = c.niagara, bold = true })
hi("OilFile", { fg = c.fg })
hi("OilSocket", { fg = c.wisteria })
hi("OilLink", { fg = c.yellow })

-- ============================================================================
-- Trouble
-- ============================================================================

hi("TroubleNormal", { fg = c.fg, bg = c.bg })
hi("TroubleText", { fg = c.fg })
hi("TroubleCount", { fg = c.yellow, bold = true })
hi("TroubleSource", { fg = c.quartz })
hi("TroubleLocation", { fg = c.niagara_1 })
hi("TroubleCode", { fg = c.quartz })

-- ============================================================================
-- Snacks
-- ============================================================================

hi("SnacksNotifierInfo", { fg = c.niagara })
hi("SnacksNotifierWarn", { fg = c.yellow })
hi("SnacksNotifierError", { fg = c.red })
hi("SnacksNotifierDebug", { fg = c.quartz })
hi("SnacksNotifierTrace", { fg = c.wisteria })

hi("SnacksExplorerNormal", { fg = c.fg, bg = c.bg })
hi("SnacksExplorerNormalNC", { fg = c.fg, bg = c.bg })
hi("SnacksSidebarNormal", { fg = c.fg, bg = c.bg })
hi("SnacksSidebarNormalNC", { fg = c.fg, bg = c.bg })

hi("SnacksExplorerTitle", { fg = c.yellow, bg = c.bg, bold = true })
hi("SnacksExplorerBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksExplorerWinBar", { fg = c.yellow, bg = c.bg, bold = true })
hi("SnacksExplorerWinBarNC", { fg = c.quartz, bg = c.bg })

hi("SnacksSidebarTitle", { fg = c.yellow, bg = c.bg, bold = true })
hi("SnacksSidebarBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksSidebarWinBar", { fg = c.yellow, bg = c.bg, bold = true })
hi("SnacksSidebarWinBarNC", { fg = c.quartz, bg = c.bg })

hi("SnacksWinNormal", { fg = c.fg, bg = c.bg })
hi("SnacksWinBar", { fg = c.yellow, bg = c.bg, bold = true })
hi("SnacksWinBarNC", { fg = c.quartz, bg = c.bg })

hi("SnacksPickerInput", { fg = c.fg, bg = c.bg })
hi("SnacksPickerInputBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksPickerInputTitle", { fg = c.yellow, bg = c.bg, bold = true })

hi("SnacksPickerNormal", { fg = c.fg, bg = c.bg })
hi("SnacksPickerBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksPickerTitle", { fg = c.yellow, bg = c.bg, bold = true })

hi("SnacksPickerList", { fg = c.fg, bg = c.bg })
hi("SnacksPickerListBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksPickerListTitle", { fg = c.yellow, bg = c.bg, bold = true })

hi("SnacksPickerPreview", { fg = c.fg, bg = c.bg })
hi("SnacksPickerPreviewBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksPickerPreviewTitle", { fg = c.black, bg = c.green, bold = true })

hi("SnacksPickerPrompt", { fg = c.fg, bg = c.bg })
hi("SnacksPickerPromptBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksPickerPromptTitle", { fg = c.black, bg = c.yellow, bold = true })

hi("SnacksPickerSelection", { bg = c.bg1 })
hi("SnacksPickerMatch", { fg = c.yellow, bold = true })

hi("SnacksExplorerInput", { fg = c.fg, bg = c.bg })
hi("SnacksExplorerInputBorder", { fg = c.bg4, bg = c.bg })
hi("SnacksExplorerInputTitle", { fg = c.yellow, bg = c.bg, bold = true })

hi("SnacksPickerFile", { fg = c.fg1 })
hi("SnacksPickerDir", { fg = c.niagara, bold = true })
hi("SnacksPickerPathHidden", { fg = c.fg1 })
hi("SnacksPickerPathIgnored", { fg = c.fg1 })
hi("SnacksPickerHidden", { fg = c.fg1 })
hi("SnacksExplorerFile", { fg = c.fg1 })

-- ============================================================================
-- Indent Blankline / Mini Indentscope
-- ============================================================================

hi("IblIndent", { fg = c.bg1 })
hi("IblScope", { fg = c.bg4 })
hi("MiniIndentscopeSymbol", { fg = c.bg4 })

-- ============================================================================
-- Lazy
-- ============================================================================

hi("LazyH1", { fg = c.black, bg = c.yellow, bold = true })
hi("LazyButton", { fg = c.fg, bg = c.bg1 })
hi("LazyButtonActive", { fg = c.black, bg = c.yellow, bold = true })
hi("LazySpecial", { fg = c.niagara })
hi("LazyProgressDone", { fg = c.green })
hi("LazyProgressTodo", { fg = c.bg3 })

-- ============================================================================
-- Mason
-- ============================================================================

hi("MasonNormal", { fg = c.fg, bg = c.bg })
hi("MasonHeader", { fg = c.black, bg = c.yellow, bold = true })
hi("MasonHighlight", { fg = c.niagara })
hi("MasonHighlightBlock", { fg = c.black, bg = c.niagara })
hi("MasonHighlightBlockBold", { fg = c.black, bg = c.niagara, bold = true })
hi("MasonMuted", { fg = c.bg4 })
hi("MasonMutedBlock", { fg = c.fg, bg = c.bg1 })

-- ============================================================================
-- Which Key
-- ============================================================================

hi("WhichKey", { fg = c.yellow })
hi("WhichKeyGroup", { fg = c.niagara })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeySeparator", { fg = c.brown })
hi("WhichKeyFloat", { bg = c.bg1 })
hi("WhichKeyBorder", { fg = c.bg4, bg = c.bg1 })
hi("WhichKeyValue", { fg = c.quartz })

-- ============================================================================
-- Markview / Markdown
-- ============================================================================

hi("@markup.heading.1", { fg = c.yellow, bold = true })
hi("@markup.heading.2", { fg = c.niagara, bold = true })
hi("@markup.heading.3", { fg = c.green, bold = true })
hi("@markup.heading.4", { fg = c.brown, bold = true })
hi("@markup.heading.5", { fg = c.wisteria, bold = true })
hi("@markup.heading.6", { fg = c.quartz, bold = true })

-- ============================================================================
-- Terminal Colors (for terminal buffers)
-- ============================================================================

vim.g.terminal_color_0  = c.bg3      -- black
vim.g.terminal_color_1  = c.red_1    -- red
vim.g.terminal_color_2  = c.green    -- green
vim.g.terminal_color_3  = c.yellow   -- yellow
vim.g.terminal_color_4  = c.niagara  -- blue
vim.g.terminal_color_5  = c.wisteria -- magenta
vim.g.terminal_color_6  = c.quartz   -- cyan
vim.g.terminal_color_7  = c.fg       -- white
vim.g.terminal_color_8  = c.bg4      -- bright black
vim.g.terminal_color_9  = c.red1     -- bright red
vim.g.terminal_color_10 = c.green    -- bright green
vim.g.terminal_color_11 = c.yellow   -- bright yellow
vim.g.terminal_color_12 = c.niagara  -- bright blue
vim.g.terminal_color_13 = c.wisteria -- bright magenta
vim.g.terminal_color_14 = c.quartz   -- bright cyan
vim.g.terminal_color_15 = c.white    -- bright white
