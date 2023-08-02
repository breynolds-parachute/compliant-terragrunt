terraform {
  source = "${get_path_to_repo_root()}/modules/noop"
}

dependency "dev" {
  config_path = "../../dev"
  mock_outputs = {
    out = "dev"
  }
}

dependency "master" {
  config_path = "../../master"
  mock_outputs = {
    out = "master"
  }
}

dependency "prod" {
  config_path = "../../prod"
  mock_outputs = {
    out = "prod"
  }
}

inputs = {
  in = "downstream ${dependency.dev.outputs.out} ${dependency.master.outputs.out} ${dependency.prod.outputs.out}"
}
