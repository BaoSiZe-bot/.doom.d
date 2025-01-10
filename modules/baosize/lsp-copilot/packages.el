(package! lsp-copilot :recipe (:host github :repo "jadestrong/lsp-copilot"
                :files ("lsp-copilot.el" "lsp-copilot")
                :pre-build (("cargo" "build" "--release") ("cp" "./target/release/lsp-copilot" "./"))))
