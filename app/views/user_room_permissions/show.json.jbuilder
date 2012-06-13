if @permission
  json.permission true
  json.owner @permission.owner
else
  json.permission false
end