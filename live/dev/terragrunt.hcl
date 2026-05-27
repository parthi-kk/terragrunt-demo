include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../terraform-classic/dev"
}