;; Stuff that I've used "customize" to set lives here. Most of the things that I allow to live here are faces,
;; otherwise I usually rip the non-face setting stuff into a better more organized file for that setting to live
;; in.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cargo-process--command-current-file-tests "test")
 '(cargo-process--command-current-test "test")
 '(cargo-process--command-test "test")
 '(compilation-context-lines t)
 '(compilation-scroll-output 'first-error)
  '(custom-safe-themes
     '("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" default))
  '(org-agenda-files
     '("/home/thor/org/agenda/dev.org" "/home/thor/org/agenda/emacs.org" "/home/thor/org/agenda/mintbase.org" "/home/thor/org/agenda/misc.org" "/home/thor/org/agenda/pers.org" "/home/thor/org/agenda/rsch.org" "/home/thor/org/cap/ideas.org" "/home/thor/org/cap/qnote.org" "/home/thor/org/journal/20210129"))
 '(org-agenda-include-deadlines t)
 '(org-agenda-include-diary t)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-todo-ignore-deadlines 'far)
 '(org-journal-enable-agenda-integration t)
  '(package-selected-packages
     '(twittering-mode org-roam poly-markdown poly-org polymode racer paredit rainbow-delimiters org-journal org-mobile languagetool popup popwin yasnippet-snippets yas-snippet-snippets yasnippet treemacs lsp-ui lsp-ivy rustic rustic-mode rust-mode lsp-mode flycheck ivy-rich free-keys sx hydra zoom use-package solarized-theme moody minions diff-hl counsel-projectile avy auto-compile))
 '(popwin-mode t)
 '(popwin:popup-window-position 'right)
 '(ring-bell-function 'ignore)
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
