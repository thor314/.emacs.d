;; Ivy: interactive completion. Select items from lists.
;; Principles: Minimalism, Simplicity, Customizeability, Discoverability.
;; Ivy, Helm, Ido are similar. Ivy is faster, more minimalistic, easier API to extend. Helm has better grepping. Use =rigrep= to overcome this.
;; [[https://writequit.org/denver-emacs/presentations/2017-04-11-ivy.html][quick-guide]]. [[https://writequit.org/denver-emacs/presentations/2017-04-11-ivy.html][ivy user manual]]: suggests many keybindings.

;; Reminder keys - also see global_keybinds.org
;; - =M-o= - hydra
;; - =S-spc= - search within current results
;; - =C-M-o= - dispatching done (keep minibuffer open)
;; - =C-M-m= - ivy-call (keep minibuffer open)
;; - =C-c C-o= - while in Minibuffer, ivy-occur
;; - =C-c r= - ivy resume
;; - =C-c z/v/V= - save window layouts with [[https://oremacs.com/2016/06/27/ivy-push-view/][ivy view]]
;; - If defining a new function, can extend behavior with ivy-actions, [[https://oremacs.com/swiper/#example---define-a-new-command-with-several-actions][ex]]
;; Installation
(use-package ivy :diminish) ; intentional redundancy; counsel installs ivy.
(setq ivy-use-virtual-buffers t ; add recents+bkmks to ivy-switch-buffer
  enable-recursive-minibuffers t
  ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy)
(ivy-mode 1)
;; Counsel provides M-x and navigation.
(use-package counsel)
;; better isearch
(use-package swiper)

;; [[https://github.com/Yevgnen/ivy-rich][ivy rich]], more self-documenting interface
(use-package ivy-rich)
(ivy-rich-mode t)
;; formatting recommendation; dumb that it makes users do this
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
(setq ivy-rich-path-style 'abbrev) ; abbreviate paths with ~/

;; [[https://github.com/ericdanan/counsel-projectile][counsel projectile]] - project navigation
(use-package projectile)
(use-package counsel-projectile)
(projectile-load-known-projects)

;; [[https://github.com/abo-abo/avy][avy]] - jump to stuff like a pro
(use-package avy)

;; [[https://github.com/tumashu/ivy-posframe][ivy-posframe: move minibuffer to centerscreen]] attractive display
(use-package ivy-posframe
  :diminish
  :config
  ;; set this for full-screen emacs display
  (setq ivy-posframe-width  160
    ;; set this to 90 for good half-screen emacs display
    ivy-posframe-min-width  90
    ;; setting next 2 equal avoids a offscreen bottom-of-buffer bug
    ivy-posframe-height     10
    ivy-posframe-min-height 10)
  (ivy-posframe-mode))
;; [[https://github.com/alexmurray/ivy-xref][Ivy-Xref]] display xref results nicely
(setq tags-table-list
  '("~/.emacs.d" "/usr/share/emacs"))
(use-package ivy-xref
  :ensure t
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))
;; [[https://github.com/raxod502/prescient.el][prescient]] completions
;; Turning prescient on remembers the last 1000 commands used and puts them at the top of the list
(use-package prescient
  :config
  (prescient-persist-mode) ;; save commonly used commands in var/prescient-save.el
  (setq prescient-history-length 1000
    prescient-frequency-decay .999
    prescient-filter-method '(literal regexp initialism))
  ;; (prescient-filter-method '(literal regexp initialism fuzzy)) ;; fuzzy is aggro
  )
(use-package ivy-prescient
  :after prescient
  :config (ivy-prescient-mode))
;; [[https://github.com/Lautaro-Garcia/counsel-spotify][Counsel Spotify]] - don't leave emacs, never leave emacs
;; Takes a little setup thru spotify.
(use-package counsel-spotify)
(setq counsel-spotify-client-id "78c85c7b50e34d74a2e879717259b650")
;; set this in secrets
;;(setq counsel-spotify-client-secret "go here: https://developer.spotify.com/dashboard/applications/78c85c7b50e34d74a2e879717259b650")
