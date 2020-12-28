(use-package rustic) ; lsp-compatible rust mode
(add-hook 'rust-mode-hook 'rustic-mode)
(add-hook 'rustic-mode-hook
					(lambda ()
						(setq rustic-lsp-server 'rust-analyzer) ; not rls
						(setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))
						(setq rustic-format-on-save t)

						(custom-set-faces
						 '(rustic-compilation-column ((t (:inherit compilation-column-number))))
						 '(rustic-compilation-line ((t (:foreground "LimeGreen")))))
						))

2	(use-package cargo)
	(add-hook 'rust-mode-hook 'cargo-minor-mode)
	(use-package toml-mode) ; syntax highlighting in toml files

(use-package flycheck-rust) ; runs on save buffer

(use-package ob-rust)

(use-package rust-playground)

(add-hook 'rustic-mode-hook
					(lambda ()
						(local-set-key (kbd "C-$") 'rustic-cargo-build)
						(local-set-key (kbd "C-\\") 'rustic-cargo-build)
						(local-set-key (kbd "M-\\") 'rustic-cargo-test)
						(local-set-key [f9] 'next-error)
						(local-set-key [f10] 'lsp-execute-code-action)
						(local-set-key (kbd "C-c C-c C-a") 'cargo-proccess-add)
						))
(add-hook 'rustic-compilation-mode-hook
					(lambda ()
						(local-set-key [f9] 'compilation-next-error)
						))
