;; Agenda
;; [[https://orgmode.org/manual/Agenda-Commands.html][Agenda Commands (The Org Manual)]]
;; [[https://github.com/alphapapa/org-super-agenda][look into super agenda, eventually]].
(defun tk/org-setup-agenda ()
  (require 'org-agenda)
    (setq org-agenda-files '("~/org/agenda/")
      org-priority-default 80 ;; between C and B
      org-agenda-start-with-log-mode t ;; log includes done entries
      org-log-into-drawer t) ;; Non-nil=>insert state change notes, timestamps into a drawer.
  (setq org-agenda-start-on-weekday nil ; start today
    org-agenda-hide-tags-regexp ".;;" ; hide all tags
    org-agenda-include-deadlines t
    ;; org-agenda-include-diary t
    org-agenda-loop-over-headlines-in-active-region nil
    org-agenda-restore-windows-after-quit t
    org-agenda-skip-deadline-if-done t
    org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled
    org-agenda-todo-ignore-deadlines 'far
    org-journal-enable-agenda-integration t)  ; include org-journal todos in agenda

    (setq org-agenda-custom-commands ; options - todo, tags, tags-todo
      '(
         ("y" agenda;;) ;; appointments: todo
         ("c" "Crypto" tags-todo "CRYPTO")
         ("e" "Emacs" tags-todo "EMACS")
         ;; ex multi letter
         ;;("g" . "HOME+Name tags searches")
         ;;("gl" tags "+home+HABIT")
         ;;("gp" tags "+home+EMACS")
         ("h" "Habit" tags-todo "HABIT")
         ("l" "Linux" tags-todo "Linux")
         ("m" "Math" tags-todo "MATH")
         ("r" "Rust" tags-todo "RUST")
         ("p" "Personal" tags-todo "PERS")
         ("w" "Write" tags-todo "WRITE")
         ("z" "Misc" tags-todo "MISC")
         ;; demo of more powerful agenda template
         ;; ("d" "Dashboard"
         ;;   ;; bug: ==== bit is 5 chars too long for my screen
         ;;   ((agenda "" ((org-deadline-warning-days 7)))
         ;;     (todo "NEXT"
         ;;       ((org-agenda-overriding-header "Next Tasks")))
         ;;     (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))
           ))))
;; [[https://orgmode.org/manual/Agenda-Views.html][agenda]].
