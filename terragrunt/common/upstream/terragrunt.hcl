terraform {
  source = "${get_path_to_repo_root()}/modules/noop"
}

inputs = {
  in = "upstream"
}
