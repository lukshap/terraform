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

variable alb_name {
  description = "ALB name"
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
      threshold           = "1000000000",
      alarm_description   = "This metric monitors the amount of available random access memory."
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "DatabaseConnections",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "230",
      alarm_description   = "This metric monitors the number of database connections in use"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "DiskQueueDepth",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "5",
      alarm_description   = "This metric monitors rds the number of outstanding IOs (read/write requests) waiting to access the disk"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "NetworkReceiveThroughput",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "1000000",
      alarm_description   = "This metric monitors rds the incoming (Receive) network traffic on the DB instance"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "NetworkTransmitThroughput",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "40000000",
      alarm_description   = "This metric monitors the outgoing (Transmit) network traffic on the DB instance"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "ReadThroughput",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "40000000",
      alarm_description   = "This metric monitors the average number of bytes read from disk per second"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "2",
      metric_name         = "WriteThroughput",
      namespace           = "AWS/RDS",
      period              = "120",
      statistic           = "Average",
      threshold           = "1000000",
      alarm_description   = "This metric monitors the average number of bytes written to disk per second"
    }
  ]
}

variable alb_alarms {
  description = "Alarms for ALB"
  default = [
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "HTTPCode_Target_5XX_Count",
      namespace           = "AWS/ApplicationELB",
      period              = "60",
      statistic           = "Sum",
      threshold           = "5",
      alarm_description   = "This metric monitors the number of 5** HTTP response codes generated by the targets"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "HTTPCode_Target_4XX_Count",
      namespace           = "AWS/ApplicationELB",
      period              = "60",
      statistic           = "Sum",
      threshold           = "5",
      alarm_description   = "This metric monitors the number of 4** HTTP response codes generated by the targets"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "HTTPCode_ELB_4XX_Count",
      namespace           = "AWS/ApplicationELB",
      period              = "60",
      statistic           = "Sum",
      threshold           = "5",
      alarm_description   = "This metric monitors the number of HTTP 4XX client error codes that originate from the load balancer"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "RequestCount",
      namespace           = "AWS/ApplicationELB",
      period              = "60",
      statistic           = "Sum",
      threshold           = "5",
      alarm_description   = "This metric monitors the number of HTTP 4XX client error codes that originate from the load balancer"
    },
    {
      comparison_operator = "GreaterThanOrEqualToThreshold",
      evaluation_periods  = "1",
      metric_name         = "TargetResponseTime",
      namespace           = "AWS/ApplicationELB",
      period              = "60",
      statistic           = "Average",
      threshold           = "0.5",
      alarm_description   = "This metric monitors the time elapsed, in seconds, after the request leaves the load balancer until a response from the target is received"
    }
  ]
}