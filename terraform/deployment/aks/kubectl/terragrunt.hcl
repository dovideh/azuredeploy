terraform {
  source = "../modules/kubectl"
}

include "root" {path=find_in_parent_folders("state.hcl")}

dependency "akscluster" {
  config_path = "../"
  mock_outputs = {
     host                   = "dummy-host"
     username               = "dummy-username"
     password               = "dummy-password"
     client_certificate     = "dGVzdAo="
     client_key             = "dGVzdAo="
     cluster_ca_certificate = "dGVzdAo="
     }
     mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}
inputs = {
     cluster_config = {
       host                   = dependency.akscluster.outputs.host
       client_certificate     = dependency.akscluster.outputs.client_certificate
       client_key             = dependency.akscluster.outputs.client_key
       cluster_ca_certificate = dependency.akscluster.outputs.cluster_ca_certificate
     }
   }
