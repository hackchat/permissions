if @permission
  json.permission true
  json.owner @permission.owner
else
  json.permission false
  json.owner false
end