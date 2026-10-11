variable "dataintegration_workspace_projects" {
  description = <<EOT
Map of dataintegration_workspace_projects, attributes below
Required:
    - identifier
    - name
    - workspace_id
Optional:
    - description
    - key
    - model_version
    - object_status
    - project_key
    - registry_metadata (block):
        - aggregator_key (optional)
        - is_favorite (optional)
        - key (optional)
        - labels (optional)
        - registry_version (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    identifier    = string
    name          = string
    workspace_id  = string
    description   = optional(string)
    key           = optional(string)
    model_version = optional(string)
    object_status = optional(number)
    project_key   = optional(string)
    registry_metadata = optional(object({
      aggregator_key   = optional(string)
      is_favorite      = optional(bool)
      key              = optional(string)
      labels           = optional(list(string))
      registry_version = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

