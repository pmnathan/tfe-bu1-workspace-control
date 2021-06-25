variable "org_name" {
  default     = "demo-rbac"
}

data "tfe_oauth_client" "client" {
  oauth_client_id = "oc-hd7uSxBZW61jiwVp"
}

data "tfe_team" "bu1admin" {
  name         = "bu1admin"
  organization = var.org_name
}


resource "tfe_workspace" "bu1-app1-aws-useast1-dev" {
  name           = "bu1-app1-aws-useast1-dev"
  organization   =  var.org_name
  execution_mode = "remote"
}

resource "tfe_team_access" "bu1-app1-aws-useast1-dev-accessadmin" {
  access       = "read"
  team_id      = data.tfe_team.bu1admin.id
  workspace_id = tfe_workspace.bu1-app1-aws-useast1-dev.id
}


resource "tfe_workspace" "bu1-app1-aws-useast1-test" {
  name           = "bu1-app1-aws-useast1-test"
  organization   = var.org_name
  execution_mode = "remote"
}


resource "tfe_workspace" "bu1-app1-aws-useast1-prod" {
  name           = "bu1-app1-aws-useast1-prod"
  organization   = var.org_name
  execution_mode = "remote"
}

resource "tfe_workspace" "bu1-app1-aws-useast2-prod" {
  name           = "bu1-app1-aws-useast2-prod"
  organization   = var.org_name
  execution_mode = "remote"
}


