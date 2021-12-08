;; Appearance
;; Declutter modeline with Diminish
;; [[https://github.com/emacsmirror/diminish][diminish]] - hide minor modes, declutter mode line. Can be used from use-package.
(use-package diminish
  :config
  (diminish 'abbrev-mode)
  (diminish 'eldoc-mode)
  (diminish 'visual-line-mode) ;; wrap
  ) ;; hide minor modes from mode line

;; Fonts
;; It's =pragma 'nov 2021'=. Get yourself some nice ligatures with [[https://github.com/tonsky/FiraCode][Fira Code]].
;; Also see: [[https://github.com/tonsky/FiraCode/wiki/Emacs-instructions][ligature.el]], for ligature settings, as of Emacs 28.
(defvar tk/default-font-size 105)
(defvar tk/default-variable-font-size 105)
(set-face-attribute 'default nil :font "Fira Code Retina" :height tk/default-font-size)
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height tk/default-font-size)
                                        ;(ligature-set-ligatures 't '("www"))
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height tk/default-variable-font-size :weight 'regular)
(global-prettify-symbols-mode 1) ; lambda -> symbol
;; Note: This mode can be aggressively annoying  with some of the symbols.
(use-package fira-code-mode :diminish
  :custom (fira-code-mode-disabled-ligatures '(">=" "<=" "=>" "x" "**" "/=" "::" "#[" "+" "==" "->" "+=" "*" "!=" "[]"  ":" ))  ; ligatures you don't want
  :hook prog-mode)

;; Improve modeline
;; [[https://github.com/Malabarba/smart-mode-line/][smart mode line]] low-config out of the box good mode line. Also considered doom-modeline, which looks to have more features.
(setq display-time-format "%l:%M %p %b %y"
  display-time-default-load-average nil)
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/apply-theme 'respectful)  ; Respect the theme colors
  (sml/setup))
;; (use-package moody) ;; moody: old mode line
;; (moody-replace-mode-line-buffer-identification)
;; (moody-replace-eldoc-minibuffer-message-function)
;; (moody-replace-vc-mode) ; branch info
;; (setq moody-mode-line-height 25)

;; All the [[https://github.com/domtronn/all-the-icons.el][Icons]]   
(use-package all-the-icons
  :bind ("C-r i" . all-the-icons-insert)
  :if (display-graphic-p))
;; run this once to install fonts
;;(all-the-icons-install-fonts)
;; Emojis 🎩 🌵 🐛
;; See company for completion, added emoji backend.
;; Known issue: emojify-insert-emoji rendering doesn't play nice with ivy-posframe.
(use-package emojify
  :hook (after-init . global-emojify-mode)
  :bind (("C-r E" . emojify-apropos-emoji)
          ("C-r e" . emojify-insert-emoji))
  :config (setq emojify-company-tooltips-p t)
  (global-emojify-mode-line-mode))

;; Theme [[https://github.com/bbatsov/solarized-emacs][sol-theme]].  Also see [[https://github.com/hlissner/emacs-doom-themes/tree/screenshots][doom]] themes.
(use-package doom-themes)
;; some of my faves:
;;(load-theme 'doom-vibrant t) ;; dark gray with blue, green, and purple highlightings
;;(load-theme 'doom-city-lights t) ;; lighter, blueish, salmon, green, blue/purle highlights
;;(load-theme 'doom-moonlight t) ;;  purple-ish, dark, think I like palenight better
(load-theme 'doom-palenight t) ;;  purple-ish, lighter
;;(load-theme 'doom-sourcerer t) ;;  dark gray, purplish flairs
;;(load-theme 'doom-wilmersdorf t) ;; light gray, purplish flairs

;; [[https://github.com/cyrus-and/zoom][zoom]] - rebalance awkwardly balanced window divisions
(use-package zoom
  :diminish
  :config
  (zoom-mode 1))

;; [[https://github.com/dgutov/diff-hl][diff-hl]] - highlight changes since last git commit in margin
(use-package diff-hl
  :diminish
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  (global-diff-hl-amend-mode)
  (diminish 'diff-hl-amend-mode))

;; [[https://github.com/Wilfred/helpful][Helpful]] - make emacs help buffers better
(use-package helpful)

;; [[https://github.com/Malabarba/beacon][Beacon]]: pulse line when changing buffer
(use-package beacon
  :diminish
  :config
  (beacon-mode 1)
  ;; make blink small, fast
  (setq beacon-color "#f4a460"
    beacon-size 10
    beacon-blink-duration 0.2
    beacon-blink-delay 0.2))
