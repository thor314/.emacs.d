;; TODO Figure out how to use compile package
;; (use-package compile
;; :straight nil
;; :custom
;; (compilation-scroll-output t))

;; (defun auto-recompile-buffer ()
;;   (interactive)
;;   (if (member #'recompile after-save-hook)
;;     (remove-hook 'after-save-hook #'recompile t)
;;     (add-hook 'after-save-hook #'recompile nil t)))

;; Magit git interface, Forge git(hub|lab) interface
(use-package magit)
(use-package git-link
  :config (setq git-link-open-in-browser t)
  :bind ("C-c g l" . git-link))
(use-package magit-todos
  ;; put todos in magit
  :after magit
  :config (magit-todos-mode))
(use-package forge :after magit)
;; NOTE: Make sure to configure a GitHub token before using this package
;; in ~/.authinfo.gpg, include the line machine api.github.com login thor314^forge password <https://magit.vc/manual/ghub/Creating-a-Token.html#Creating-a-Token>
;; - [[https://magit.vc/manual/magit.html][magit]] - interface git
;; - [[https://magit.vc/manual/forge.html][forge]] - interface github
;; - [[https://github.com/alphapapa/magit-todos#installation][magit todos]] - todos in magit buffer
;; -  [[pu][Git link]] - convenience function for copying Git(hub|lab|etc) URL to clipboard

;; [[http://company-mode.github.io/][company]] text-completion
;; - [[https://github.com/raxod502/prescient.el][prescient: Simple but effective sorting and filtering]]
;; - [[https://github.com/PythonNut/company-flx][company-flx: Flx fuzzy matching for company]]
;; - [[https://github.com/dunn/company-emoji][company emojify]] :cactus: 🎑
(use-package company :diminish)
(use-package company-emoji)
(eval-after-load "company"
  (progn
    '(add-to-list 'company-backends 'company-shell)
    '(add-to-list 'company-backends 'company-anaconda)
    '(add-to-list 'company-backends 'company-emoji)
    ))
(use-package company-prescient)
;; (use-package company-flx ;; company-prescient does the job well
;;   :config
;;   (with-eval-after-load 'company
;;     (company-flx-mode +1)))
(add-hook 'company-mode-hook
  (lambda ()
    (setq company-idle-delay 0.2 ;; how long to wait until popup
      company-show-quick-access 1
      company-minimum-prefix-length 1)
                                        ;(company-prescient-mode)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "M-n") 'company-select-last)
    (define-key company-active-map (kbd "M-p") 'company-select-first)
    ))
;; LSP
;; [[https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/][visual guide to lsp configuration]]
(setq lsp-keymap-prefix "M-n")
(use-package lsp-mode
  :hook (rustic-mode . lsp)
  :commands lsp)
;; sometimes quite laggy:
(use-package lsp-ui)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(setq lsp-enable-symbol-highlighting nil ;; highlight instances
  lsp-ui-doc-enable nil ;; hover dialogs
  lsp-lens-enable nil ;; number references to object
  lsp-headerline-breadcrumb-enable nil ;; top path
  lsp-ui-sideline-show-code-actions nil
  lsp-modeline-code-actions-enable t
  lsp-diagnostics-provider :flycheck
  lsp-ui-sideline-show-diagnostics t ;; sideline errors
  lsp-eldoc-enable-hover nil ;;  modeline feedback and laggg
  lsp-signature-auto-activate nil ;; you could manually requiest them via `lsp-signature-activate`
  ;;( lsp-signature-render-documentation nil ;; render docs
  lsp-completion-provider :capf ; completion backend
  lsp-idle-delay 0.5 ; refresh highlights
  lsp-enable-snippet nil ; hide yasnippets from company completes
  lsp-show-snippet nil)
;; Definition with eldoc tends to be the most lag-inducing.
;; [[https://emacs-lsp.github.io/lsp-mode/][lsp-mode]].
;; [[https://emacs-lsp.github.io/lsp-mode/page/installation/][setup-instructions]].

;; Eglot - experimental alternative to lsp.
;; :(use-package eglot
;; (add-to-list 'eglot-server-programs '(rustic-mode . ("foo-language-server" "--args")))
;; (add-hook 'rustic-mode-hook 'eglot-ensure)

;; Yasnippets
(use-package yasnippet :diminish)
(use-package yasnippet-snippets :diminish)
(yas-reload-all)
;; Prog mode
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'prog-mode-hook
  (lambda ()
    (company-mode)
    (use-package flycheck :diminish)
    (flycheck-mode)
    (yas-minor-mode)
    (diminish 'yas-minor-mode)
    (local-set-key [f8] 'yas-visit-snippet-file)
    (local-set-key (kbd "<C-f8>") 'yas-new-snippet)
    (local-set-key (kbd "C-h <f8>") 'yas-describe-tables)
    (local-set-key (kbd "<C-f8>") 'yas-new-snippet)
    (subword-mode 1) ; ThisStuffIsFiveWords on M-f M-b
    (diminish 'subword-mode)
    ;; eldoc can lag significantly
    (setq eldoc-mode nil) ; definitions appear in minibuffer (redundant with global-eldoc-mode)
    ;;(hs-minor-mode) ; code folding
    (show-paren-mode) ; higlight matching parens pairs at point
    (use-package rainbow-delimiters) ; Pretty rainbows for the grown man's S-expr's
    (rainbow-delimiters-mode)
    (rainbow-identifiers-mode)

    ;; ;;compilation;; buffer
    ;; skip some lines in compilation messages; rustic ignores this
    ;; (setq compilation-context-lines t)
    ;; scroll to first error; rustic ignores
    (setq compilation-scroll-output 'first-error)
    ))

;; [[https://github.com/Fanael/rainbow-delimiters][rainbow-delimiters]].
;; [[https://github.com/joaotavora/yasnippet][yasnippet]].
;; [[https://github.com/AndreaCrotti/yasnippet-snippets][collection]].

;; Prog mode keybinds
(add-hook 'prog-mode-hook
  (lambda ()
    (local-set-key [f4] 'flycheck-next-error)
    (local-set-key (kbd "<C-f4>") 'flycheck-previous-error)
    ))
