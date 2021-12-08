;; Markdown
;; I basically only use markdown for shared README's.
(add-hook 'markdown-mode-hook
  (lambda ()
    (turn-off-auto-fill)))
;; Poly mode for native code blocks in org and markdown
;; [[https://github.com/polymode/polymode][polymode: Framework for Multiple Major Modes in Emacs]]
;; [[https://github.com/polymode/poly-markdown][poly-markdown: Polymode for markdown-mode]]
;; [[https://github.com/polymode/poly-org][poly-org: Polymode for org-mode]]
(use-package polymode)
;; known issue with indentation, poly-org sometimes indents elisp blocks 2 spaces, and sometimes only one, unclear why
;; second known issue, poly-org-mode seems to run flycheck on the text at the top outline section.
;; third known issue, poly-org-mode seems to break syntax highlighting
;; fourth known issue, bugs out with variable pitch fonts
;; that's...too much for me dude. Try again eventually
;;(use-package poly-org)
;;(add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode))
(use-package poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;; Flyspell
(add-hook 'flyspell-mode-hook
  (lambda ()
    ;; don't want flyspell setting these keys
    (define-key flyspell-mode (kbd "C-.") nil)
    (define-key flyspell-mode (kbd "C-,") nil)
    ))
;; [[https://github.com/SavchenkoValeriy/emacs-powerthesaurus][Thesaurus]] - not great; only gives one word without a pro subscription ($30/yr).
(use-package powerthesaurus)
;; Text-mode hook
(add-hook 'text-mode-hook
  (lambda ()
    ;; nts. auto-fill looks nice, but makes a lot of formatting things
    ;; a pain in the ass, and I'm too lazy to fix them all. Turning off.
    ;;(turn-on-auto-fill)
    (setq sentence-end-double-space nil) ; single space after periods
    (setq line-number-mode nil)
    ;; note: turn flyspell mode on for syntax highlighting, but leave off by default
    (local-set-key (kbd "M-j") 'org-meta-return)
    (local-set-key (kbd "<f9>") 'flyspell-goto-next-error)
    (local-set-key (kbd "C-<f9>") 'flyspell-correct-word)
    (local-set-key (kbd "M-<f9>") 'flyspell-correct-previous-word)
    (local-set-key (kbd "C-M-<f9>") 'flyspell-mode)
    (local-set-key (kbd "C-<f10>") 'powerthesaurus-lookup-word-dwim)
    ))


;; Ispell support packages: Hunspell and Hunspell-english sold separately.

;; Font lock - special highlighting; disabled
;;    (add-hook 'org-mode-hook ; mostly just an example
;;     (lambda ()
;;       (font-lock-add-keywords nil '(("\\<\\(thor\\|THOR\\|tk\\|TK\\)\\>" 1  font-lock-warning-face t)))))

;; =org-mobile= Sync's my org directories to my phone. - BUG: prevents quit
;;  until Dropbox installed
;;  [[https://mobileorg.github.io/features/][org-mobile]].
;;
;;    (use-package org-mobile-sync)
;;   (setq org-mobile-inbox-for-pull "~/org/org_mobile_pull_inbox.org")
;;   (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;;   (setq org-mobile-files '("~/org/agenda" "~/org/cap"  "~/org/note"))
;; automate push if emacs is idle for 30s and on emacs exit
;;   (run-with-idle-timer 30 nil 'org-mobile-push)
;;   (add-hook 'kill-emacs-hook 'org-mobile-push)


;; Electric Pair mode (auto-match pairs) - disabled
;; https://stackoverflow.com/questions/27871876/custom-pairs-in-emacs-electric-pair-mode
;; Commented out 2021-11-05, too inconsistently useful.
                                        ;(defvar tk-org-mode-electric-pairs '((?= . ?=)  "Custom electric pairs for org-mode."))
                                        ;(defun org-mode-add-electric-pairs ()
                                        ;(setq-local electric-pair-pairs (append electric-pair-pairs tk-org-mode-electric-pairs))
                                        ;(setq-local electric-pair-text-pairs electric-pair-pairs))
