data "tfe_oauth_client" "client" {
  oauth_client_id = "oc-hd7uSxBZW61jiwVp"
}


resource "tfe_workspace" "bu1-app1-aws-useast1-dev" {
  name           = "bu1-app1-aws-useast1-dev"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkshopdemo"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}

/*
resource "tfe_workspace" "bu1-app1-aws-useast1-test" {
  name           = "bu1-app1-aws-useast1-test"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkshopdemo"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}


resource "tfe_workspace" "bu1-app1-aws-useast1-prod" {
  name           = "bu1-app1-aws-useast1-prod"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkshopdemo"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}

resource "tfe_workspace" "bu1-app1-aws-useast2-prod" {
  name           = "bu1-app1-aws-useast2-prod"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkshopdemo"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}

*/
