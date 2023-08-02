terraform {
  source = "${get_path_to_repo_root()}/modules/noop"
}

dependency "upstream" {
  config_path = "../common/upstream/"
}

inputs = {
  in = "prod ${dependency.upstream.outputs.out}"
}
