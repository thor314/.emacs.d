;;  [[https://github.com/kidd/org-gcal.el#Installation][org-calendar]] - waiting on issue resolution
;;
;; On pause:
;; - [[https://github.com/kidd/org-gcal.el/issues/141][instructions]]
;; - [[https://console.cloud.google.com/apis/credentials?project=tk-org-gcal][calendar api page]]
(use-package org-gcal
  :defer t
  :config
  (setq org-gcal-client-id
    "1096406758325-1ru1lhls2pvc2vfn28spdia1hs768uql.apps.googleusercontent.com"
    org-gcal-client-secret (my-fetch-password :user "1096406758325-1ru1lhls2pvc2vfn28spdia1hs768uql.apps.googleusercontent.com" :machine "gcloud")
    org-gcal-fetch-file-alist '(("thor314@gmail.com" .  "~/org/cal/thor_cal.org")
                                 ("houpormfl9c8jc8ml0rsl0icpg@group.calendar.google.com" . "~/org/cal/bonk_dor_cal.org")))
  (org-gcal-fetch))

;; Variable spaced font
;;
;; Prefer variable-spaced font when looking at text, monospaced when
;; looking at code. Variable-pitch screws a bunch of things up, so copy
;; pasta a soln in.
;; https://github.com/daviwil/emacs-from-scratch/blob/master/Emacs.org/#better-font-faces
(defun tk/org-font-setup ()
  """variable-pitch-mode makes text display inconsistent; fix the inconsistencies"""
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                   (org-level-2 . 1.1)
                   (org-level-3 . 1.05)
                   (org-level-4 . 1.0)
                   (org-level-5 . 1.1)
                   (org-level-6 . 1.1)
                   (org-level-7 . 1.1)
                   (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))
  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))
;; Quick packages -
;; [[https://github.com/integral-dw/org-superstar-mode][org-superstar-mode:
;; Make org-mode stars a little more super]] -
;; [[https://github.com/rexim/org-cliplink][org-cliplink: Insert org-mode
;; links from clipboard]] -
;; [[https://github.com/abo-abo/org-download][org-download: Drag and drop
;; images to Emacs org-mode]] -
;; [[https://github.com/bastibe/org-journal][org-journal: A simple org-mode
;; based journaling mode]]
(defun tk/org-load-packages ()
  (use-package org-superstar ;; supercedes org-bullets:
    :diminish
    :config
    (org-superstar-mode)
    ;; This line is necessary.
    (setq org-superstar-leading-bullet ?\s)
    ;; If you use Org Indent you also need to add this, otherwise the
    ;; above has no effect while Indent is enabled.
    (org-indent-mode)
    (diminish 'org-indent-mode)

    (setq org-indent-mode-turns-on-hiding-stars nil)
    (setq org-ellipsis " ▾"))
  ;; Turn on the following with org-bullets for nicer looking outlines
  ;; issue: supposed to work with twitter threads, currently broken
  ;; though, couldn't figure out how to fix.
  (use-package org-cliplink) ; bound to C-c y
  (use-package org-download)
  (add-hook 'dired-mode-hook 'org-download-enable)
  ;; Use the heck out of org-journal
  (use-package org-journal)

  ;; org-habit is a built in library for tracking stuff about repeating
  ;; tasks why use: habits displayed with consistency graph: How
  ;; consistent at getting that task done.
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  ;; variable pitch mode looks good in text buffers without code blocks
  (setq org-journal-dir "~/org/journal"
    org-journal-file-format "%Y%m%d.org"))

;; Tags [[https://orgmode.org/manual/Tags.html#Tags][tags]]
;; Default tags available in org files. Syntax =?x= for literal ASCII value of x.
(defun tk/org-setup-tags ()
  (setq org-tag-alist
    '((:startgroup)
       ;; Put mutually exclusive tags here
       (:endgroup)
       ("CRYPTO" . ?c)
       ("EMACS" . ?e)
       ("HABIT" . ?h)
       ("LINUX" . ?l)
       ("MATH" . ?m)
       ("NOTE" . ?n)
       ("PERS" . ?p)
       ("RUST" . ?r)
       ("WRITE" . ?w)
       ("MISC" . ?z))))

;; Org-specific keybinds
(add-hook 'org-mode-hook
  (lambda ()
    ;; following 3 are for debugging
    (local-set-key (kbd "C-c y") 'org-cliplink) ;; similar to my function (see next line)
    (local-set-key (kbd "C-; y") 'link-last-word-from-kill)
    (local-set-key (kbd "C-c C-r") 'org-schedule)
    (local-set-key (kbd "<f1> e") 'tk-org-insert-lisp-block)
    (local-set-key (kbd "<f1> p") 'tk-org-insert-python-block)
    (local-set-key (kbd "<f1> r") 'tk-org-insert-rust-block)
    (local-set-key (kbd "<f1> d") 'insert-date)
    (global-set-key (kbd "<f1> d") 'insert-date)
    (local-set-key (kbd "C-'") 'avy-goto-char) ; overwrite switch agenda files
    (local-set-key (kbd "C-,") 'ivy-switch-buffer)
    (local-set-key (kbd "C-.") 'other-window)))

;; Hook
(use-package org
  :pin org ;; Pin the package to an archive
  :commands (org-capture org-agenda) ;; load the package
  :config
  (add-hook 'org-mode-hook
    (lambda ()
      (tk/org-font-setup)
      (variable-pitch-mode 1)
      (tk/org-load-packages)
      (tk/org-setup-tags)
      (tk/org-setup-agenda)
      (diminish 'buffer-face-mode)
      ;; See manual 5.2.3. (x) - fast select. ! - timestamp it. @ - note w
      ;; timestamp. default: TODO, DONE. Can set this to have more complex
      ;; project management. A bit overkill, but good demo
      (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
           (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "|" "CANC(k@/!)")))
      ;; Save Org buffers after refiling, confirm saving fewer files on emacs exit
      (advice-add 'org-refile :after 'org-save-all-org-buffers)

      ;; settings
      (setq org-src-fontify-natively t ; syntax-highlight if org recognizes src block
        org-src-tab-acts-natively t ; use programming major modes in src blocks
        org-adapt-indentation nil ; turn off special indentation in org subsections
        org-directory "~/org"
        org-log-done 'time) ; timestamp when TODO - DONE
      )))

;; Pretteh [[https://github.com/kiwanami/emacs-calfw][calendar]]: calfw -
;; deprecated, pretteh but not well maintained/documented
;;
;; (use-package calfw
;;   :config
;;   ;; make pretteh-er
;;   (setq cfw:fchar-junction ?╋
;;     cfw:fchar-vertical-line ?┃
;;     cfw:fchar-horizontal-line ?━
;;     cfw:fchar-left-junction ?┣
;;     cfw:fchar-right-junction ?┫
;;     cfw:fchar-top-junction ?┯
;;     cfw:fchar-top-left-corner ?┏
;;     cfw:fchar-top-right-corner ?┓))
;; (use-package calfw-org
;;   :bind ("C-r o" . cfw:open-org-calendar)
;;   :config
;;   (setq cfw:org-agenda-schedule-args '(:timestamp)))
