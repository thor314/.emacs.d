;; Rustic - lsp extensions to rust-mode
(use-package rustic) ; lsp-compatible rust mode
(add-hook 'rust-mode-hook 'rustic-mode)
(add-hook 'rustic-mode-hook
  (lambda ()
    (setq rustic-lsp-server 'rust-analyzer) ; not rls
    ;; manage rust analyzer binary separate from emacs
                                        ;(setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))
    ;;(setq lsp-rust-analyzer-store-path "~/.cargo/bin/rust-analyzer")
    (define-key rustic-mode-map (kbd "TAB") 'company-indent-or-complete-common)

    ;; if format on save bugging, comment out following line
    (setq rustic-format-on-save t)
    (local-set-key (kbd "C-c C-c C-o") 'cargo-process-fmt)
    (local-set-key (kbd "C-c C-c C-a") 'rustic-cargo-add)

    (setq rustic-indent-offset 2)
    (setq rustic-match-angle-brackets nil)

    ;; also try display-buffer-other-frame
    (setq rustic-compile-display-method 'ignore) ; don't pop up a buffer
    (setq-local buffer-save-without-query nil) ; save, don't ask me
    ;;(setq lsp-rust-analyzer-cargo-watch-command "clippy") ; as opposed to check.
    (setq rustic-match-angle-brackets t)
    ))
;; [[https://github.com/brotzeit/rustic][rustic]].
;; [[https://rust-analyzer.github.io/manual.html][rust-analyzer]].

;; Cargo binds and .toml  mode font-lock
(use-package cargo)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(use-package toml-mode) ; syntax highlighting in toml files
;; [[https://github.com/kwrooijen/cargo.el][cargo]].
;; [[https://github.com/dryman/toml-mode.el][toml-mode]].

;; Flycheck
(use-package flycheck-rust) ; runs on save buffer
;; [[https://github.com/flycheck/flycheck-rust][flycheck-rust]].

;; Org-babel rust integration, don't use very much though
(use-package ob-rust)
;; [[https://github.com/micanzhang/ob-rust][ob-rust]].

;; get a rust playground
(use-package rust-playground)
;; [[https://github.com/grafov/rust-playground][rust-playground]]. Note. C-RET => compile in playground

;; Keybinds
(add-hook 'rustic-mode-hook
  (lambda ()
    (local-set-key (kbd "C-$") 'rustic-cargo-build)
    (local-set-key (kbd "C-\\") 'rustic-cargo-build)
    (local-set-key (kbd "M-\\") 'rustic-cargo-test)
    (setq rustic-test-arguments "-- --nocapture")
    (local-set-key (kbd "M-|") 'rustic-cargo-test-rerun) ; use nocapture
    (local-set-key [f9] 'next-error)
    (local-set-key [f10] 'lsp-execute-code-action)
    ))
(add-hook 'rustic-compilation-mode-hook
  (lambda ()
    (local-set-key [f9] 'compilation-next-error)
    ))

;; DEPRECATED: Racer - LSP now eclipses Racer entirely Not well maintained
;; unfortunately (ugh), but very useful. I have this line in my =.zshrc=,
;; and a hook to set the environment variable =rust-racer-src-path=.

;; export RUST_SRC_PATH='/home/thor/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library'
;;    (use-package racer)
;; (add-hook 'rustic-mode-hook 'racer-mode)
;; (add-hook 'racer-mode-hook
;;   (lambda ()
;;     (setq racer-rust-src-path
;;       "/home/thor/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library")
;;     ))
;; : [[https://github.com/racer-rust/racer][rust-racer]].
;; [[https://github.com/racer-rust/emacs-racer][emacs-racer]].
