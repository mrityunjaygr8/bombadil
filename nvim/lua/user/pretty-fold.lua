local status_ok, pf = pcall(require, "pretty-fold")
if not status_ok then
  return
end

pf.setup()
