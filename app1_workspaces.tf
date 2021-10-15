variable "org_name" {
  default     = "demo-rbac"
}

variable "aws_key_id" {
  description = "AWS Key ID"
}

variable "aws_key_secret" {
  description = "AWS SECRET"
  sensitive   = true
}


variable "test_aws_key_id" {
  description = "AWS Key ID"
}

variable "test_aws_key_secret" {
  description = "AWS SECRET"
  sensitive   = true
}





data "tfe_oauth_client" "client" {
  oauth_client_id = "oc-hd7uSxBZW61jiwVp"
}

data "tfe_team" "bu1admin" {
  name         = "bu1admin"
  organization = var.org_name
}

data "tfe_team" "bu1dev" {
  name         = "bu1dev"
  organization = var.org_name
}


resource "tfe_workspace" "bu1-app1-aws-useast1-dev" {
  name           = "bu1-app1-aws-useast1-dev"
  organization   =  var.org_name
  execution_mode = "remote"
}

resource "tfe_variable" "bu1-app1-aws-useast1-dev-awskey" {
  key          = "AWS_KEY_ID"
  value        = var.aws_key_id
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-dev.id
}

resource "tfe_variable" "bu1-app1-aws-useast1-dev-awssecret" {
  key          = "AWS_SECRET"
  value        = var.aws_key_secret
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-dev.id
  sensitive    = true
}


resource "tfe_team_access" "bu1-app1-aws-useast1-dev-accessadmin" {
  access       = "admin"
  team_id      = data.tfe_team.bu1admin.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-dev.id
}

resource "tfe_team_access" "bu1-app1-aws-useast1-dev-accessdev" {
  access       = "write"
  team_id      = data.tfe_team.bu1dev.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-dev.id
}



resource "tfe_workspace" "bu1-app1-aws-useast1-test" {
  name           = "bu1-app1-aws-useast1-test"
  organization   = var.org_name
  execution_mode = "remote"
}

resource "tfe_variable" "bu1-app1-aws-useast1-test-awskey" {
  key          = "AWS_KEY_ID"
  value        = var.test_aws_key_id
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-test.id
}

resource "tfe_variable" "bu1-app1-aws-useast1-test-awssecret" {
  key          = "AWS_SECRET"
  value        = var.test_aws_key_secret
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-test.id
  sensitive    = true
}

resource "tfe_team_access" "bu1-app1-aws-useast1-test-accessadmin" {
  access       = "admin"
  team_id      = data.tfe_team.bu1dev.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-test.id
}

resource "tfe_team_access" "bu1-app1-aws-useast1-test-accessdev" {
  access       = "write"
  team_id      = data.tfe_team.bu1admin.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-test.id
}




resource "tfe_workspace" "bu1-app1-aws-useast1-prod" {
  name           = "bu1-app1-aws-useast1-prod"
  organization   = var.org_name
  execution_mode = "remote"
}

resource "tfe_variable" "bu1-app1-aws-useast1-prod-awskey" {
  key          = "AWS_KEY_ID"
  value        = var.aws_key_id
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-prod.id
}

resource "tfe_variable" "bu1-app1-aws-useast1-prod-awssecret" {
  key          = "AWS_SECRET"
  value        = var.aws_key_secret
  category     = "terraform"
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-prod.id
  sensitive    = true
}

resource "tfe_team_access" "bu1-app1-aws-useast1-prod-accessadmin" {
  access       = "admin"
  team_id      = data.tfe_team.bu1dev.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-prod.id
}

resource "tfe_team_access" "bu1-app1-aws-useast1-prod-accessdev" {
  team_id      = data.tfe_team.bu1admin.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-prod.id
  permissions {
    runs = "read"
    variables = "read"
    state_versions = "true"
    sentinel_mocks = "true"
    workspace_locking = true
  }
}




