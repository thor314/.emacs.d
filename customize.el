;; A good workflow: use customize group, see what gets set here, paste it into other parts of my config.
;; Customize has a good face/theme interface, so allow theme information to live here.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "42ec9eaa86da5f052feed0e35b578681015b9e21ab7b5377a5a34ea9a0a9e1b9" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" default))
  '(lui-formatting-list
     '(("\\(?:^\\|[[:space:]]\\)\\(\\*[^*[:space:]]+?\\*\\)\\(?:$\\|[[:space:]]\\)" 1 lui-strong-face)
        ("\\(?:^\\|[[:space:]]\\)\\(_[^_[:space:]]+?_\\)\\(?:$\\|[[:space:]]\\)" 1 lui-emphasis-face)))
  '(org-agenda-files
     '("/home/thor/org/agenda/dev.org" "/home/thor/org/agenda/emacs.org" "/home/thor/org/agenda/habits.org" "/home/thor/org/agenda/mintbase.org" "/home/thor/org/agenda/misc.org" "/home/thor/org/agenda/pers.org" "/home/thor/org/agenda/project_ideas.org" "/home/thor/org/agenda/rsch.org" "/home/thor/org/agenda/write.org" "/home/thor/org/journal/20211123.org"))
  '(package-selected-packages
     '(esh-autosuggest circe-notifications powerthesaurus theme-magic restart-emacs circe sx all-the-icons-gnus beacon counsel-spotify moody smartparens-config smartparens request company-anaconda anaconda-mode lsp-ui parrot parrot-mode undo-tree company-prescient ivy-prescient prescient org-ref ivy-bibtex zweilight-theme company-org-roam twittering-mode org-roam poly-markdown poly-org polymode racer paredit rainbow-delimiters org-journal org-mobile languagetool popup popwin yasnippet-snippets yas-snippet-snippets yasnippet lsp-ivy rustic rustic-mode rust-mode lsp-mode flycheck ivy-rich free-keys hydra zoom use-package solarized-theme minions diff-hl counsel-projectile avy auto-compile))
  '(rustic-ansi-faces
     ["black" "red3" "green3" "yellow3" "sandy brown" "magenta3" "cyan3" "white"])
  '(safe-local-variable-values
     '((org-src-preserve-indentation)
        (eval require 'ox-texinfo+ nil t)
        (eval require 'ol-info)
        (eval require 'org-roam-dev))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-journal-calendar-entry-face ((t (:foreground "salmon" :slant italic))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "tomato" :slant italic))))
 '(rustic-compilation-column ((t (:inherit compilation-column-number))))
 '(rustic-compilation-line ((t (:foreground "LimeGreen")))))
