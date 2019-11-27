variable region {
  description = "AWS region"
  default = "eu-central-1"
}

variable instance_tag_name_jenkins {
  description = "Instance tag name"
}

variable instance_tag_name_dev {
  description = "Instance tag name"
}

variable instance_tag_name_prod {
  description = "Instance tag name"
}

variable alarm_email {
  description = "Email for sns topic subscription"
}

variable instance_alarms {
  description = "Alarms for instance"
  default = [
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "CPUUtilization",
      namespace           = "AWS/EC2",
      period              = "120",
      statistic           = "Average",
      threshold           = "80",
      alarm_description   = "This metric monitors ec2 cpu utilization"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "StatusCheckFailed_Instance",
      namespace           = "AWS/EC2",
      period              = "120",
      statistic           = "Average",
      threshold           = "1",
      alarm_description   = "This metric monitors the status of the instance status check"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "StatusCheckFailed_System",
      namespace           = "AWS/EC2",
      period              = "120",
      statistic           = "Average",
      threshold           = "1",
      alarm_description   = "This metric monitors the status of the system status check"
    }
  ]
}