resource "tfe_workspace" "bu1-app1-aws-useast1-dev" {
  name           = "bu1-app1-aws-useast1-dev"
  organization   = "prakash_demo_tfc_business"
  execution_mode = "remote"
  vcs_repo   {
    identifier     = "pmnathan/tfworkspacedemo"
    oauth_token_id = "ot-sh6cWy6QhrRQTeNb"
  }
}
