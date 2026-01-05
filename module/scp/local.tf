locals {
  json_files                  = fileset(path.module, "./service/workload/**/*.json")
  json_as_string              = join(",", [for f in local.json_files : file("${path.module}/${f}")])
  json_replace_instance_type  = replace(local.json_as_string, "instance_type", jsonencode(var.instance_type))
  json_replace_instance_size  = replace(local.json_replace_instance_type, "instance_size", jsonencode(var.instance_size))
  json_replace_imdsv2_max_hop = replace(local.json_replace_instance_size, "var.imdsv2_max_hop", tostring(var.imdsv2_max_hop))

  json_data = format("{ \"Statement\": [%s], \"Version\": \"2012-10-17\"}", local.json_replace_imdsv2_max_hop)

  application_name = title(var.application_name)
}
