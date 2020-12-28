(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'prog-mode-hook
					(lambda ()
						(subword-mode)
						(show-paren-mode t) ; higlight matching parens pairs at point
						;(setq buffer-save-without-query t) ; don't query-save before compiling
))

(use-package magit)
(use-package forge
	:after magit)
(setq auth-sources '("~/.authinfo.gpg"))

(use-package flycheck)
(global-flycheck-mode 1)

(use-package company)
(setq company-minimum-prefix-length 1)

(use-package treemacs)
(use-package treemacs-projectile)

(setq lsp-keymap-prefix "M-n")
(use-package lsp-mode
	:hook (rustic-mode . lsp)
	:commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(setq lsp-completion-provider :capf) ; completion backend
(setq lsp-idle-delay 0.2) ; refresh highlights

(add-hook 'prog-mode-hook
(lambda ()
	(local-set-key [f5] 'tk-comment-dwim) ))
