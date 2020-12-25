(setq sentence-end-double-space nil) ; single space after periods
(setq-default fill-column 115)

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
