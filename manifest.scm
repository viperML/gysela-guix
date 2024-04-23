(concatenate-manifests
  (list
    ;; Get the development dependecies of gyselalibxx
    ;; As specified from https://gitlab.inria.fr/guix-hpc/guix-hpc/-/blob/master/guix-hpc/packages/gysela.scm
    (package->development-manifest
      (specification->package "gyselalibxx"))

    (specifications->manifest
      (list
        ;; Include bash, to run a shell with the namespaces
        "bash"

        ;; Extra dependecies needed for the shell
        "lapack"))))
