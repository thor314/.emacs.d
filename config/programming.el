(add-hook 'prog-mode-hook
 (lambda ()
 (local-set-key [f5] 'tk-comment-dwim)
))

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'prog-mode-hook (lambda ()
   (subword-mode)
   (show-paren-mode t) ; higlight matching parens pairs at point
))
