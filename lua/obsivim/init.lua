local M = {}

local defaults = {
  dir = "~/Journal",
  date_format = "%Y-%m-%d",
  template = "obsivim_template.md",
}

local config = vim.deepcopy(defaults)

local function expand(path)
  return vim.fn.expand(path)
end

local function template_path(journal_dir)
  local candidate = journal_dir .. "/" .. config.template
  if vim.fn.filereadable(candidate) == 1 then
    return candidate
  end
  candidate = expand(config.template)
  if vim.fn.filereadable(candidate) == 1 then
    return candidate
  end
end

local function read_template(journal_dir)
  local path = template_path(journal_dir)
  if not path then
    return {}
  end
  return vim.fn.readfile(path)
end

function M.setup(opts)
  config = vim.tbl_deep_extend("force", defaults, opts or {})
end

function M.journal()
  local dir = expand(config.dir)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local filepath = dir .. "/" .. os.date(config.date_format) .. ".md"

  if vim.fn.filereadable(filepath) == 0 then
    vim.fn.writefile(read_template(dir), filepath)
  end

  vim.cmd.edit(vim.fn.fnameescape(filepath))
end

return M
