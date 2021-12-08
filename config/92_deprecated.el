;; [[https://github.com/lewang/flx][Flx]] - fuzzy-matching - deprecated for prescient
(use-package flx  ;; Improves sorting for fuzzy-matched results
  :after ivy
  :defer t
  :init
  (setq ivy-flx-limit 10000))
;; =pop-win= - less annoying help and compilation buffers
;; Not currently using; useful to customize how compilation buffers appear.
                                        ;(use-package popup) ; not making use atm. Creates dropdown ui.
(use-package popwin
  :config
  (popwin-mode 1)
  ;; popup buffers, if I want to use them
  (setq popwin:popup-window-position 'right))
;; [[https://github.com/emacsorphanage/popwin][popwin]].
;; [[https://github.com/auto-complete/popup-el][popup]].
;; [[https://github.com/hayamiz/twittering-mode][twittering-mode]] - deprecated; not maintaned, too many warnings and errors, bad auth, okay but not great client
(use-package twittering-mode
  :config
  (bind-keys :prefix "C-r t"
    :prefix-map my-twit-mode
    :prefix-docstring "Global keymap for twit mode."
    ("t" . twit)
    ("p" . gtwittering-update-status-from-pop-up-buffer)
    ))
;; (setq twittering-use-master-password nil)
;; fails w/ error: setq: Symbol’s function definition is void: epa--decode-coding-string
;; so just put up with authenticating each session
;; [[https://github.com/atykhonov/emacs-howdoi][howdoi]] - deprecated; package unfunctional, not maintained
;; deprecated: [[https://github.com/jcaw/theme-magic][theme-magic]] Make the rest of linux look more like emacs - package buggy, not maintained
;; dependency: =pip3 install pywal=
;; (use-package theme-magic)
(theme-magic-from-emacs)
;; update the rest of linux when I update emacs' theme
(theme-magic-export-theme-mode)

;; =esup= the startup profiler - deprecated until issue solved
;; [[https://github.com/jschaf/esup][esup: ESUP - Emacs Start Up Profiler]]
;; Usage: Run M-x esup to get profiling data. This plus the following are
(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa)
;; Hide-show mode infrequently used, removed 2021-10-13.

;; Treemacs - interact w dir structure in sidebar - rarely used
(use-package treemacs)
(use-package treemacs-projectile)
;; [[https://github.com/Alexander-Miller/treemacs][treemacs]]. Btw, great hydra example.
