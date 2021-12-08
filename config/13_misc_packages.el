(use-package wgrep
  :after rg
  :config
  (setq wgrep-auto-save-buffer t
    wgrep-enable-key "r"))
(use-package rg
  :after wgrep
  :config
  (autoload 'wgrep-rg-setup "wgrep-rg")
  (add-hook 'rg-mode-hook 'wgrep-rg-setup))

(use-package sx
  :config
  (bind-keys :prefix "C-r s"
    :prefix-map my-sx-map
    :prefix-docstring "Global keymap for SX."
    ("q" . sx-tab-all-questions)
    ("i" . sx-inbox)
    ("o" . sx-open-link)
    ("u" . sx-tab-unanswered-my-tags)
    ("a" . sx-ask)
    ("s" . sx-search)))

(use-package expand-region
:bind ("C-=" . er/expand-region))

(use-package free-keys
  :config (global-set-key (kbd "C-x e") 'free-keys))

(use-package which-key
  :diminish
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay .5
    which-key-popup-type 'minibuffer)) ;; doesn't eat half the screen
(use-package which-key-posframe
  :config
  (which-key-posframe-mode))

(use-package restart-emacs
  :config
  (setq restart-emacs-restore-frames nil) ;; try to restore frames
  (global-set-key (kbd "C-x c") 'restart-emacs))

(use-package bug-hunter
  :config (global-set-key (kbd "C-x b") 'bug-hunter-init-file)
  (global-set-key (kbd "C-x B") 'bug-hunter-file))

(use-package re-builder
      :config (global-set-key (kbd "C-x x") 're-builder))

(use-package crontab-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.?cron\\(tab\\)?\\." . crontab-mode)))

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode)
  :config (global-set-key (kbd "C-r u") 'undo-tree-visualize))

(use-package command-log-mode
  :config (global-set-key (kbd "C-r h") 'clm/open-command-log-buffer))

(use-package super-save
:diminish
  :config (super-save-mode 1)
  (setq super-save-auto-save-when-idle t
    super-save-idle-duration 30
    auto-save-default nil))
