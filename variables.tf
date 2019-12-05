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

variable rds_dev {
  description = "RDS name"
}

variable rds_sqlserver {
  description = "RDS name"
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
      threshold           = "90",
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
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "MemoryUtilization",
      namespace           = "System/Linux",
      period              = "120",
      statistic           = "Average",
      threshold           = "90",
      alarm_description   = "This metric monitors ec2 memory utilization"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "DiskSpaceUtilization",
      namespace           = "System/Linux",
      period              = "120",
      statistic           = "Average",
      threshold           = "90",
      alarm_description   = "This metric monitors ec2 disk space \"/\" partition utilization",
      dimensions          = {
        MountPath         = "/",
        Filesystem        = "/dev/nvme0n1p1"
      }
    }
  ]
}

variable rds_alarms {
  description = "Alarms for RDS"
  default = [
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "CPUUtilization",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "90",
      alarm_description   = "This metric monitors rds cpu utilization"
    },
    {
      comparison_operator = "LessThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "FreeStorageSpace",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "50000000000",
      alarm_description   = "This metric monitors rds free space"
    },
    {
      comparison_operator = "LessThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "FreeableMemory",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "2000000000",
      alarm_description   = "This metric monitors rds free RAM"
    }
  ]
}