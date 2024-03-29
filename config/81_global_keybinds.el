;; F keys
;; f1: insert something.
;; f2: macros
(global-set-key [f2] 'kmacro-end-or-call-macro)
(global-set-key (kbd "<C-f2>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<M-f2>") 'kmacro-edit-macro-repeat)
(global-set-key (kbd "<C-M-f2>") 'kmacro-step-edit-macro)

(global-set-key [f10] 'nil)
;; f11: project and file navigation
(global-set-key [f11] 'counsel-projectile-find-file) ; not convinced I want treemacs annd projectile here.
(global-set-key (kbd "<C-f11>") 'projectile-switch-project)
(global-set-key (kbd "<M-f11>") 'projectile-switch-to-buffer-other-frame)
;; f12 journal, org-capture, org-roam
(global-set-key [f12] 'org-capture)
(global-set-key (kbd "<C-f12>") 'org-roam-capture)
(global-set-key (kbd "<C-S-f12>") 'org-roam-node-find)
(global-set-key (kbd "<M-f12>") 'org-journal-new-entry)
;; warning. Don't try to set C-M-f12. Turns screen off.

;; Search-replace (used heavily)
(global-set-key (kbd "C-%") 'replace-regexp)
(global-set-key (kbd "M-%") 'replace-string)
(global-set-key (kbd "C-M-%") 'query-replace-string)
;; Dired and Eshell (C-r l e|d)
(global-set-key (kbd "C-r d") 'dired-jump)
(global-set-key (kbd "C-r t") 'eshell) ; e for emoji
;; My functions
(global-set-key (kbd "C-!") 'window-split-toggle)
;; Ivy, Avy, Swiper
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "M-'") 'avy-goto-word-1)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-r v") 'ivy-push-view)
(global-set-key (kbd "C-r V") 'ivy-pop-view)
(global-set-key (kbd "C-r z") 'ivy-switch-view) ; low usage
(global-set-key (kbd "C-r r") 'ivy-resume)
(global-set-key (kbd "C-s") 'swiper-isearch)

;; Counsel (and Projectile)
;; note that there's a new mode called =counsel-mode= that does most of this remapping for new users.
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-r p SPC") 'counsel-projectile)
(global-set-key (kbd "C-r p d") 'counsel-projectile-find-dir)
(global-set-key (kbd "C-r p s") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-r p r") 'projectile-remove-known-project)
(global-set-key (kbd "C-r p a") 'projectile-add-known-project)

;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h C-h") #'helpful-at-point)
(setq counsel-describe-function-function #'helpful-callable)
(setq counsel-describe-variable-function #'helpful-variable)
(global-set-key (kbd "C-h s") 'helpful-symbol)
(global-set-key (kbd "C-h b") 'counsel-descbinds) ; Very Useful^tm, much more so than the default
(global-set-key (kbd "C-h B") 'describe-bindings) ; Very Useful^tm, much more so than the default
(global-set-key (kbd "C-h i") 'info)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-c b") 'counsel-bookmark) ; note: bkmks overlap with ivy-view
(global-set-key (kbd "C-r k") 'counsel-rg)
(global-set-key (kbd "C-r g") 'lgrep)
(global-set-key (kbd "C-r K") 'rg)
(global-set-key (kbd "C-r l") 'counsel-locate)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "<menu>") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "C-c o") 'counsel-outline) ; jump to a different outline heading
(global-set-key (kbd "M-y") 'counsel-yank-pop) ; nicer kill ring
                                        ;(global-set-key (kbd "C-r u") 'counsel-unicode-char)

(global-set-key (kbd "C-r m") 'counsel-linux-app) ; launch an application
(global-set-key (kbd "C-r w") 'counsel-wmctrl) ; switch windows
(global-set-key (kbd "C-r C-L") 'counsel-locate) ; competes with org store link
;; counsel also has good git grepping, look into at some point if needed

;; Counsel spotify
(global-set-key (kbd "C-r C-s C-p") 'counsel-spotify-play)
(global-set-key (kbd "C-r C-s C-u") 'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "C-r C-s C-b") 'counsel-spotify-previous)
(global-set-key (kbd "C-r C-s C-f") 'counsel-spotify-next)
(global-set-key (kbd "C-r C-s C-s C-s") 'counsel-spotify-search)
(global-set-key (kbd "C-r C-s C-s C-a") 'counsel-spotify-search-artist)
(global-set-key (kbd "C-r C-s C-s C-l") 'counsel-spotify-search-album)
(global-set-key (kbd "C-r C-s C-s C-r") 'counsel-spotify-search-tracks-by-artist)
(global-set-key (kbd "C-r C-s C-s C-b") 'counsel-spotify-search-tracks-by-album)
;; Window and formatting
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-M-.") 'other-frame)
(global-set-key (kbd "C-,") 'ivy-switch-buffer)
(global-set-key (kbd "<home>") 'text-scale-increase)
(global-set-key (kbd "<end>") 'text-scale-decrease)
(global-set-key (kbd "RET") 'newline-and-indent)
;; Misc packages
                                        ;(global-set-key (kbd "C-r t") 'twit)
;; Org launchers
(global-set-key (kbd "C-c l") 'org-store-link) ; a link to dir in org file
(global-set-key (kbd "C-r a") 'org-agenda)
(global-set-key (kbd "C-r c") 'org-capture)
