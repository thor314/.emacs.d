;; Python develompent _Packages to know_
;; [[https://github.com/jorgenschaefer/elpy][Elpy]]: complete python
;; server. Elpy may be slower but more feature complete.
;; [[https://github.com/pythonic-emacs/anaconda-mode][Anaconda]]: minimal
;; interface to jedi library, alternative to elpy.
;; [[https://tkf.github.io/emacs-jedi/latest/][Jedi]]: pythonic
;; auto-completion, used by company-anaconda as backend

;; Start with the minimal [[https://github.com/pythonic-emacs/anaconda-mode][anaconda]]
;; with [[https://github.com/pythonic-emacs/company-anaconda][company-anaconda]]
(use-package anaconda-mode)
(use-package company-anaconda)
(add-hook 'python-mode-hook
  (lambda ()
    (anaconda-mode)
    (anaconda-eldoc-mode)
    )
  )
