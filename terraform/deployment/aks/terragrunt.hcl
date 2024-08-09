terraform {
  source = "."
}
include "root" {path=find_in_parent_folders("state.hcl")}

inputs = {
  # other input variables for the AKS deployment
}
