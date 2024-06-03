mock_provider "aws" {}

run "basic" {
  command = plan

  variables {
    notification = {
      email = {
        addresses = ["security@example.com"]
      }
    }
    tags = {
      team = "security"
    }
  }
}
