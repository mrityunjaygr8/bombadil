local status_ok, fp = pcall(require, "fold-preview")
if not status_ok then
  return
end

fp.setup()
