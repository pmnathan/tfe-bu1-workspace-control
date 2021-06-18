data "tfe_oauth_client" "client" {
  oauth_client_id = "oc-hd7uSxBZW61jiwVp"
}


resource "tfe_workspace" "bu1-app1-aws-useast1-dev" {
  name           = "bu1-app1-aws-useast1-dev"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkspacedemo"
    oauth_token_id = tfe_oauth_client.client.oauth_token_id
  }
}
