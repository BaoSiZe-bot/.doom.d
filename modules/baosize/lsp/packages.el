(package! lsp-mode :disable t :ignore t)
(if (modulep! :baosize lsp +lsp-bridge)
(progn (package! lsp-bridge
  :recipe (:host github
           :repo "manateelazycat/lsp-bridge"
           :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
           ;; do not perform byte compilation or native compilation for lsp-bridge
           :build (:not compile)))
(package! f)
(package! cape))
(if (modulep! :baosize lsp +lspce)
(progn (package! lspce
  :recipe (:host github
           :repo "zbelial/lspce"
           :files ("*.so" "*.el")
           :pre-build
           (shell-command "cargo build && mv target/release/liblspce_module.so lspce-module.so")))
(package! f)
(package! cape))
(if (modulep! :baosize lsp +lsp-copilot)
(package! lsp-copilot :recipe (:host github :repo "jadestrong/lsp-copilot"
                :files ("lsp-copilot.el" "lsp-copilot")
                :pre-build (("cargo" "build" "--release") ("cp" "./target/release/lsp-copilot" "./"))))
(package! eglot-booster
  :recipe(:host github :repo "jdtsmith/eglot-booster")))))
