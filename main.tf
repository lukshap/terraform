module "alarms" {
//  source                    = "git::git@github.com:lukshap/aws_alarms_ec2.git"
  source                    = "../aws_alarms_ec2"
  instance_alarms           = var.instance_alarms
  instance_tag_name_jenkins = var.instance_tag_name_jenkins
  instance_tag_name_dev     = var.instance_tag_name_dev
  instance_tag_name_prod    = var.instance_tag_name_prod
  alarm_email               = var.alarm_email
}