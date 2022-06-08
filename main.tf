terraform {
  cloud {
    organization = "jellayy"

    workspaces {
      name = "atlantis-testing"
    }
  }
}

provider "aws" {
  region = "us-west-1" # Any AWS EC2 Region
}

module "ec2_apache" {
  source          = "Jellayy/ec2-apache/aws"
  server_name     = "Very Great Web Server" # Name of your server
  ssh_allowed_ips = "72.201.119.0/24" # CIDR IP block to allow SSH traffic on
  ssh_public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6+9Tj14EGNEdpu43ZET0z1g7RxgEryQqlCYgO9SxKfT/jRssp3sr2kQML7UWoakmxtX3L8z4h7y9wvzXiMYX+W95M+cq5FtnrMmRFxyDekM6nhfkJjgYGnJ1HRH+DBpAaG3igqQmtUGLxtSzkpp6VNwJz1o1ZuJW+qFqxbH7/r/CncWno+ZkvQQQIMlM9YaZ96nERimX2JhW5ueEoe8jI53hVn9r1eGcuCUxf5paQBNLrzZ5j1uAKHgVc/8CjT/ONeydfAGC9q1ZcMCFkBI2FxGi8NXU6PfFikvKPZ710QE/d+80bqMSiQgAEFG007eEFBNRHhfsJsJq0ny0VNTRdt4H1C6v/YsrAQegqIhXBOFGHh8Iovz2KJtatTMJizCGcsxTMZiwrqdPF1hSNhiCnZg7eg27PdHj6a3Fo9IbDuxRHJ4Kjq6LW6zVoK2M6DUaI/GvI1dEdrQ9XncQvxIucamkITMG/4FyhmKFkiJQ2M4ItHpfyNK/7Ww+rEEPY1Dc= jellayy@mbp.jellayy.com" # Generated public key
}

output "web_server_ip" {
  value = module.ec2_apache.ec2_public_ip # Outputs server's public IP to terraform outputs
}