;; [[https://github.com/Fuco1/smartparens][Smart Parens]] >
;; electric-pair-mode or paredit for parens matching; note =Mx
;; sp-cheat-sheet=

;; Movement and transformations based on sexps is paradigm for text
;; editing, whenever there are nested levels of sexp's. Most useful for any
;; sort of programming, but also useful for any matching-pair behaviors.
;; Takes about 2 hours to learn and an hour to set up.
;; [[https://github.com/Fuco1/smartparens/wiki][Wiki]]. Globals
(use-package smartparens
  :diminish)
(smartparens-global-mode 1)
(add-hook 'smartparens-mode-hook
  (lambda ()
    ;; smart movement
    (local-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
    (local-set-key (kbd "C-M-e") 'sp-end-of-sexp)
    (local-set-key (kbd "C-M-f") 'sp-forward-sexp)
    (local-set-key (kbd "C-M-b") 'sp-backward-sexp)
    (local-set-key (kbd "C-M-n") 'sp-down-sexp)
    (local-set-key (kbd "C-M-p") 'sp-up-sexp) ; confusing
    ;; use this to delete matching sexp
    (local-set-key (kbd "M-[") 'sp-backward-unwrap-sexp)
    (local-set-key (kbd "M-]") 'sp-unwrap-sexp)
    ;; move sexp limits
    (local-set-key (kbd "<C-right>") 'sp-forward-slurp-sexp)
    (local-set-key (kbd "<M-right>") 'sp-backward-slurp-sexp)
    (local-set-key (kbd "<C-left>") 'sp-forward-barf-sexp)
    (local-set-key (kbd "<M-left>") 'sp-backward-barf-sexp)
    (local-set-key (kbd "C-M-t") 'sp-transpose-sexp)
    (local-set-key (kbd "C-x C-t") 'sp-transpose-hybrid-sexp)
    ;; kill
    (local-set-key (kbd "C-M-k") 'sp-kill-sexp)
    (local-set-key (kbd "C-k") 'sp-kill-hybrid-sexp)
    (local-set-key (kbd "M-k") 'sp-backward-kill-sexp)
    (local-set-key (kbd "C-M-w") 'sp-copy-sexp)
    (local-set-key (kbd "C-M-c") 'sp-clone-sexp)
    (local-set-key (kbd "C-M-v") 'sp-convolute-sexp)
    (local-set-key (kbd "C-M-d") 'sp-delete-word)
    ;; back-o space-o
    (local-set-key (kbd "C-<backspace>") 'sp-backward-kill-word)
    (local-set-key (kbd "M-<backspace>") 'backward-kill-word)

    (local-set-key (kbd "C-; (") 'sp-wrap-round)
    (local-set-key (kbd "C-; {") 'sp-wrap-curly)
    (local-set-key (kbd "C-; [") 'sp-wrap-square)
    ;; custom pairs, do this:
    (sp-pair "`" "`" :wrap "C-; `" :unless '(sp-point-after-word-p) :post-handlers '(("[d1]" "SPC")))
    ))
;;(sp-local-pair 'org-mode "\\left(" "\\right)" :insert "C-b l" :trigger "\\l(")
;; General txt modes - ignore emojis and smileys that look like :)
(require 'smartparens-text)
(require 'smartparens-markdown)

;; Org-mode
;; [[https://github.com/Fuco1/smartparens/blob/master/smartparens-org.el][reference]]
(require 'smartparens-org) ;; load predicates
(sp-with-modes 'org-mode
  (sp-local-pair ";;" ";;"
    :unless '(sp-point-after-word-p sp-point-at-bol-p)
    :skip-match 'sp--org-skip-asterisk :wrap "C-; ;;")
  (sp-local-pair "_" "_" :unless '(sp-point-after-word-p))
  (sp-local-pair "/" "/" :unless '(sp-point-after-word-p sp-org-point-after-left-square-bracket-p) :post-handlers '(("[d1]" "SPC")) :wrap "C-; /") ;; deletes the matching pair if I press space
  (sp-local-pair "~" "~" :unless '(sp-point-after-word-p) :post-handlers '(("[d1]" "SPC")) :wrap "C-; ~")
  (sp-local-pair "=" "=" :unless '(sp-point-after-word-p) :post-handlers '(("[d1]" "SPC")) :wrap "C-; =")
  (sp-local-pair "'" nil :actions nil))

;; Elisp
;; ignore single quote
(sp-with-modes 'emacs-lisp-mode (sp-local-pair "'" nil :actions nil))
;; Latex
(require 'smartparens-latex)
;; Rust
(require 'smartparens-rust)
