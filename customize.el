;; A good workflow: use customize group, see what gets set here, paste it into other parts of my config.
;; Customize has a good face/theme interface, so allow theme information to live here.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(custom-safe-themes
     '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" default))
  '(org-agenda-files
     '("/home/thor/org/agenda/agenda.org" "/home/thor/org/agenda/archive.org" "/home/thor/org/agenda/habits.org" "/home/thor/org/agenda/ideas.org" "/home/thor/org/agenda/todo.org" "/home/thor/org/journal/20211206.org"))
  '(package-selected-packages
     '(dired-rainbow smart-mode-line emojify eshell-syntax-highlighting doom-themes git-link magit-todos rg wgrep expand-region which-key-posframe ivy-posframe super-save which-key org-bullets org-superstar cdlatex auctex esup crontab-mode org-download org-cliplink zoom yasnippet-snippets use-package undo-tree twittering-mode treemacs-projectile toml-mode theme-magic sx smartparens rustic rust-playground restart-emacs rainbow-delimiters powerthesaurus popwin poly-markdown org-roam org-journal ob-rust moody lsp-ui lsp-ivy ivy-rich ivy-prescient helpful free-keys forge flycheck-rust fira-code-mode esh-autosuggest diff-hl counsel-spotify counsel-projectile company-shell company-prescient company-anaconda command-log-mode circe-notifications bug-hunter bitlbee beacon auto-compile all-the-icons-gnus all-the-icons-dired)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rustic-compilation-column ((t (:inherit compilation-column-number))))
 '(rustic-compilation-line ((t (:foreground "LimeGreen")))))
