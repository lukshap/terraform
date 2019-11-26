data "aws_instances" "jenkins" {
  instance_tags = {
    Name = "jenkins"
  }

  instance_state_names = ["running", "stopped"]
}
