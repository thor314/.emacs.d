;; Org-roam- Cc n [lfgic]
;; [[https://www.orgroam.com/manual/][docs]] and [[https://github.com/org-roam/org-roam][source]].
;; Setup
;; Create a file: Org roam find file
(use-package org-roam
  :init (setq org-roam-v2-ack t))
(add-hook 'org-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c n r") 'org-roam)
    (local-set-key (kbd "C-c n n") 'org-roam-ref-add)
    (local-set-key (kbd "C-c n i") 'org-roam-insert)
    (local-set-key (kbd "C-c n I") 'org-roam-insert-immediate)
    (local-set-key (kbd "C-c n f") 'org-roam-find-file)
    (local-set-key (kbd "C-c n g") 'org-roam-graph)
    (local-set-key (kbd "C-c n a") 'org-roam-tag-add)
    (local-set-key (kbd "C-c n d") 'org-roam-tag-delete)
    ))

;; enables org-roam on startup
;; (add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-directory "~/org/roam")
(setq org-roam-completion-system 'ivy)
(setq org-roam-capture--file-name-default "<%Y-%m%-%d>-${slug}")
;; optional index file keeps links to main files
;; (setq org-roam-index-file "index.org")
