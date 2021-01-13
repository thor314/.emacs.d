;; Stuff that I've used "customize" to set lives here. Most of the things that I allow to live here are faces,
;; otherwise I usually rip the non-face setting stuff into a better more organized file for that setting to live
;; in.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/agenda"))
 '(org-agenda-include-deadlines t)
 '(org-agenda-include-diary t)
 '(org-agenda-start-on-weekday nil)
 '(package-selected-packages
	 '(twittering-mode racer paredit rainbow-delimiters org-journal org-mobile languagetool popup popwin yasnippet-snippets yas-snippet-snippets yasnippet treemacs lsp-ui lsp-ivy rustic rustic-mode rust-mode lsp-mode flycheck ivy-rich free-keys sx hydra zoom use-package solarized-theme moody minions diff-hl counsel-projectile avy auto-compile))
 '(rustic-ansi-faces
	 ["black" "red3" "green3" "yellow3" "sandy brown" "magenta3" "cyan3" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-journal-calendar-entry-face ((t (:foreground "salmon" :slant italic))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "tomato" :slant italic))))
 '(rustic-compilation-column ((t (:inherit compilation-column-number))))
 '(rustic-compilation-line ((t (:foreground "LimeGreen")))))