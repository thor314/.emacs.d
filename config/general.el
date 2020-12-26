(defalias 'yes-or-no-p 'y-or-n-p) ; brevity is the soul of wit
(setq inhibit-startup-message t)
      (setq gc-cons-threshold 2000000) ; default is 800KB, set to 20MB
      (setq require-final-newline t)
      (setq next-line-add-newlines t) ; add newline on C-n at EOF
      (setq-default dired-listing-switches "-alh") ; add human-readable units
      (setq-default tab-width 2)
      (add-hook 'before-save-hook 'delete-trailing-whitespace)
      ;; Put backups~ and #autosaves# in /tmp
      (setq backup-directory-alist
			      `((".*" . ,temporary-file-directory)))
      (setq auto-save-file-name-transforms
			      `((".*" ,temporary-file-directory t)))

(auto-composition-mode 0) ; text characters auto-composed by functions
(blink-cursor-mode 0) ; annoyingly blink the cursor
(file-name-shadow-mode 0) ; dims unused parts of files in minibuffer
(line-number-mode 0) ; clutter mode line
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-window-scroll-bars (minibuffer-window) nil nil) ; why scroll bar in minibuffer

(auto-compression-mode 1) ; auto-handle (un)?zip on visit zipped file
(auto-encryption-mode 1) ; automatic file (en|de)cryption
(delete-selection-mode 1) ; delete region on entry
(use-package diff-hl) ; highlight diffs from last commit in fringe
(global-diff-hl-mode 1)
(electric-indent-mode 1) ; auto-indent on enter
(electric-pair-mode 1) ; match () {} ...
(global-auto-revert-mode 1) ; revert buffers when file changes on disk
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(global-eldoc-mode) ; show in echo area the argument list of the function being written
(global-font-lock-mode 1) ; decorate text
(global-hl-line-mode 1)
(global-prettify-symbols-mode 1) ; lambda -> symbol
(mouse-wheel-mode 1) ; allow scroll by mouse-wheel
(transient-mark-mode 1) ; don't hide active selected region
(use-package zoom) ; rebalance awkwardly balanced window divisions
(zoom-mode 1)

(use-package solarized-theme)
(load-theme 'solarized-gruvbox-dark t)

(use-package moody)
(moody-replace-mode-line-buffer-identification)
      (moody-replace-vc-mode) ; branch info
(setq moody-mode-line-height 15)

(global-set-key [f2] 'eshell)
(global-set-key [f11] nil)
; f3, f4 reserved for macro binds.
; f5-f11 are mode specific. f12 is org-capture.

(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "<home>") 'text-scale-increase)
(global-set-key (kbd "<end>") 'text-scale-decrease)
(global-set-key (kbd "RET") 'newline-and-indent)

(add-hook 'eshell-mode-hook
					(lambda ()
						((local-set-key (kbd "M-p")) 'eshell-previous-matching-input-from-input)
						(local-set-key (kbd "M-n")) 'eshell-previous-matching-input-from-input))
