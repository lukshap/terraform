resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                = "jenkins_CPU"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
//  alarm_actions             = ["${aws_autoscaling_policy.bat.arn}"]
  insufficient_data_actions = []

  dimensions = {
    InstanceId = data.aws_instances.jenkins.ids[0]
  }
}
