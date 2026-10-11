variable "observabilityadmin_telemetry_rule_for_organizations" {
  description = <<EOT
Map of observabilityadmin_telemetry_rule_for_organizations, attributes below
Required:
    - rule_name
Optional:
    - region
    - tags
    - rule (block):
        - all_regions (optional)
        - allow_field_updates (optional)
        - destination_configuration (optional, block):
            - cloudtrail_parameters (optional, block):
                - advanced_event_selectors (optional, block):
                    - field_selectors (optional, block):
                        - ends_with (optional)
                        - equals (optional)
                        - field (required)
                        - not_ends_with (optional)
                        - not_equals (optional)
                        - not_starts_with (optional)
                        - starts_with (optional)
                    - name (optional)
            - destination_pattern (optional)
            - destination_type (optional)
            - elb_load_balancer_logging_parameters (optional, block):
                - field_delimiter (optional)
                - output_format (optional)
            - log_delivery_parameters (optional, block):
                - log_types (optional)
            - msk_monitoring_parameters (optional, block):
                - enhanced_monitoring (optional)
            - retention_in_days (optional)
            - vpc_flow_log_parameters (optional, block):
                - log_format (optional)
                - max_aggregation_interval (optional)
                - traffic_type (optional)
            - waf_logging_parameters (optional, block):
                - log_type (optional)
                - logging_filter (optional, block):
                    - default_behavior (optional)
                    - filters (optional, block):
                        - behavior (optional)
                        - conditions (optional, block):
                            - action_condition (optional, block):
                                - action (required)
                            - label_name_condition (optional, block):
                                - label_name (optional)
                        - requirement (optional)
                - redacted_fields (optional, block):
                    - method (optional)
                    - query_string (optional)
                    - single_header (optional, block):
                        - name (required)
                    - uri_path (optional)
        - regions (optional)
        - resource_type (optional)
        - scope (optional)
        - selection_criteria (optional)
        - telemetry_source_types (optional)
        - telemetry_type (required)
EOT

  type = map(object({
    rule_name = string
    region    = optional(string)
    tags      = optional(map(string))
    rule = optional(list(object({
      all_regions         = optional(bool)
      allow_field_updates = optional(bool)
      destination_configuration = optional(list(object({
        cloudtrail_parameters = optional(list(object({
          advanced_event_selectors = optional(list(object({
            field_selectors = optional(list(object({
              ends_with       = optional(list(string))
              equals          = optional(list(string))
              field           = string
              not_ends_with   = optional(list(string))
              not_equals      = optional(list(string))
              not_starts_with = optional(list(string))
              starts_with     = optional(list(string))
            })))
            name = optional(string)
          })))
        })))
        destination_pattern = optional(string)
        destination_type    = optional(string)
        elb_load_balancer_logging_parameters = optional(list(object({
          field_delimiter = optional(string)
          output_format   = optional(string)
        })))
        log_delivery_parameters = optional(list(object({
          log_types = optional(list(string))
        })))
        msk_monitoring_parameters = optional(list(object({
          enhanced_monitoring = optional(string)
        })))
        retention_in_days = optional(number)
        vpc_flow_log_parameters = optional(list(object({
          log_format               = optional(string)
          max_aggregation_interval = optional(number)
          traffic_type             = optional(string)
        })))
        waf_logging_parameters = optional(list(object({
          log_type = optional(string)
          logging_filter = optional(list(object({
            default_behavior = optional(string)
            filters = optional(list(object({
              behavior = optional(string)
              conditions = optional(list(object({
                action_condition = optional(list(object({
                  action = string
                })))
                label_name_condition = optional(list(object({
                  label_name = optional(string)
                })))
              })))
              requirement = optional(string)
            })))
          })))
          redacted_fields = optional(list(object({
            method       = optional(string)
            query_string = optional(string)
            single_header = optional(list(object({
              name = string
            })))
            uri_path = optional(string)
          })))
        })))
      })))
      regions                = optional(set(string))
      resource_type          = optional(string)
      scope                  = optional(string)
      selection_criteria     = optional(string)
      telemetry_source_types = optional(list(string))
      telemetry_type         = string
    })))
  }))
}

