output "instance_id" {
  description = "Instance ID"
  value       = data.aws_instances.jenkins.ids
}

