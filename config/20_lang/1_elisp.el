;; General settings
(setq lisp-indent-offset 2)
;; turn off the ;;; Code type recommendations
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; [[https://github.com/justinbarclay/parinfer-rust-mode][Parinfer]] - a
;; code formatting tool for lisps! - deprecated.
;;
;; Bug one: annoyingly inquires if it can format the text - maybe fixed w/
;; check before to nil? Nope not fixed! Thus, deprecated. Bug two:
;; sometimes opens its own strange buffer for elisp text editing that
;; doesn't save back to the og buffer (see messages.org)

  ;; (use-package parinfer-rust-mode
  ;;   :hook emacs-lisp-mode
  ;;   :config
  ;;   (setq parinfer-check-before-enable nil)
  ;;   (setq parinfer-rust-auto-download t))
;; <deprecated> =paredit= - use smartparens instead

;;(reason: smartparens has better cross-language support, also see
;;[[https://www.reddit.com/r/emacs/comments/1q99wi/moving_from_paredit_to_smartparens/][boz's]]
;;recc)
