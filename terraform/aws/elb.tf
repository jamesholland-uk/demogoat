# Create a new load balancer
resource "aws_elb" "weblb" {
  name = "weblb-terraform-elb"

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  subnets                     = [aws_subnet.web_subnet.id]
  security_groups             = [aws_security_group.web-node.id]
  instances                   = [aws_instance.web_host.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400


  tags = {
    demo-owner           = "james"
    git_commit           = "1028590e2f0ce4081bdb8ee091f0b6e5323f8ba1"
    git_file             = "terraform/aws/elb.tf"
    git_last_modified_at = "2021-07-09 12:53:57"
    git_last_modified_by = "jamoiholland@gmail.com"
    git_modifiers        = "eurogig/jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "demogoat"
    yor_trace            = "a3b6c43d-a836-4e24-978c-f1df55ced062"
    level                = "production"
    pci-dss              = "true"
    team                 = "cloud-eng"
  }
}