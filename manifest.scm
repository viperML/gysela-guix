(concatenate-manifests 
  (list
    (package->development-manifest
      (specification->package "gyselalibxx"))
    (specifications->manifest
      (list
        "bash"))))
