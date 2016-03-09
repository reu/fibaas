local lapis = require("lapis")
local app = lapis.Application()

function fib(n)
  if n == 0 then
    return 0
  elseif n == 1 then
    return 1
  else
    return fib(n -1) + fib(n - 2)
  end
end

app:get("/:number", function(self)
  return tostring(fib(tonumber(self.params.number)))
end)

return app
