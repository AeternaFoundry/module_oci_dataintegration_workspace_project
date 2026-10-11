resource "oci_dataintegration_workspace_project" "dataintegration_workspace_projects" {
  for_each = var.dataintegration_workspace_projects

  identifier    = each.value.identifier
  name          = each.value.name
  workspace_id  = each.value.workspace_id
  description   = each.value.description
  key           = each.value.key
  model_version = each.value.model_version
  object_status = each.value.object_status
  project_key   = each.value.project_key

  dynamic "registry_metadata" {
    for_each = each.value.registry_metadata != null ? [each.value.registry_metadata] : []
    content {
      aggregator_key   = registry_metadata.value.aggregator_key
      is_favorite      = registry_metadata.value.is_favorite
      key              = registry_metadata.value.key
      labels           = registry_metadata.value.labels
      registry_version = registry_metadata.value.registry_version
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

