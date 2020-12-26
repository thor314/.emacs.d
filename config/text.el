(setq sentence-end-double-space nil) ; single space after periods
(setq-default fill-column 115)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-adapt-indentation nil)
(setq line-number-mode nil)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defun tk-org-insert-lisp-block ()
(interactive)
(beginning-of-line)
(insert "#+begin_src emacs-lisp\n\t\n#+end_src")
(previous-line))

(defun tk-org-insert-rust-block ()
(interactive)
(beginning-of-line)
(insert "#+begin_src rust\n\t\n#+end_src")
(previous-line))

(add-hook 'org-mode-hook
  (lambda ()
  (local-set-key (kbd "C-; e") 'tk-org-insert-lisp-block)
  (local-set-key (kbd "C-; r") 'tk-org-insert-rust-block)))
