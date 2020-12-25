;; note: the following line can cause problems. Comment if so.
(defalias 'yes-or-no-p 'y-or-n-p) ; brevity is the soul of wit
(setq gc-cons-threshold 2000000) ; default is 800KB, set to 20MB
(delete-selection-mode t)
(setq require-final-newline t)
(setq inhibit-startup-message t)
;(setq initial-scratch-message nil)
(setq visible-bell t)
(setq-default dired-listing-switches "-alh") ; add human-readable units

;; General text formatting
(setq tab-width 2)
(setq next-line-add-newlines t)

;; Put backups and autosaves in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; revert buffers when file changes on disk
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(defun tk-offer-to-create-dir-on-save ()
	"On saving a file to a non-existant dir, query user to create dir."
	(add-hook
	 'before-save-hook   (lambda ()
	 (when buffer-file-name
	 (let ((dir (file-name-directory buffer-file-name)))
	 (when (and (not (file-exists-p dir))
	 (y-or-n-p (format "Dir %s does not exist. Create? " dir)))
	 (make-directory dir t)))))))
(tk-offer-to-create-dir-on-save)

(global-set-key [f2] 'eshell)
(global-set-key [f11] nil)
; Note: f3, f4 reserved for macro binds.
; f5-f11 are mode specific. f12 is org-capture.

(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "<home>") 'text-scale-increase)
(global-set-key (kbd "<end>") 'text-scale-decrease)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "RET") 'newline-and-indent)
