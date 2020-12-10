wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"
wrk.body = '{"name": "xiaoming","pw": "xxx"}'
 
init = function(args)
   local r = {}
   r[1] = wrk.format(nil, "/login")
   r[2] = wrk.format(nil, "/name")
   r[3] = wrk.format(nil, "/pw")
 
   req = table.concat(r)
end
 
request = function()
   return req
end
