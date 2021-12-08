;; Link last word from kill ring WIP
(defun link-last-word-from-kill ()
  (interactive)
  (push-mark)
  (backward-word)
  (insert "[[")
  (yank)
  (insert "][")
  (forward-word)
  (insert "]]")
  (pop-mark))

;; Copy/yank without newlines
;; https://emacs.stackexchange.com/questions/1051/copy-region-from-emacs-without-newlines
(defun my-copy-simple (beg end)
  "Save the current region to the kill ring after stripping extra
whitespace and new lines"
  (interactive "r")
  (copy-region-as-kill beg end)
  (with-temp-buffer
    (yank)
    (goto-char 0)
    (while (looking-at "[ \t\n]")
      (delete-char 1))
    (compact-uncompact-block)
    (mark-whole-buffer)
    (kill-region (point-min) (point-max))))

;; better than fill-paragraph:
(defun compact-uncompact-block ()
  "Remove or add line ending chars on current paragraph.
This command is similar to a toggle of `fill-paragraph'. When
there is a text selection, act on the region."
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”.
  (let (currentStateIsCompact (bigFillColumnVal 4333999) (deactivate-mark nil))

    (save-excursion
      ;; Determine whether the text is currently compact.
      (setq currentStateIsCompact
        (if (eq last-command this-command)
          (get this-command 'stateIsCompact-p)
          (if (> (- (line-end-position) (line-beginning-position)) fill-column) t nil) ) )

      (if (region-active-p)
        (if currentStateIsCompact
          (fill-region (region-beginning) (region-end))
          (let ((fill-column bigFillColumnVal))
            (fill-region (region-beginning) (region-end))) )
        (if currentStateIsCompact
          (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil)) ) )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact nil t)) ) ) )

;; Create Dir on Save
(defun offer-to-create-dir-on-save ()
  "On saving a file to a non-existant dir, query user to create dir."
  (add-hook 'before-save-hook
    (lambda ()
      (when buffer-file-name
        (let ((dir (file-name-directory buffer-file-name)))
          (when (and (not (file-exists-p dir))
                  (y-or-n-p (format "Dir %s does not exist. Create? " dir)))
            (make-directory dir t)))))))
(offer-to-create-dir-on-save)
;; Transpose Frame
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
    (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                  #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

;; Insert
;; org-src-blocks
(defun tk-org-insert-lisp-block ()
  (interactive)
  (beginning-of-line)
  (insert "#+begin_src emacs-lisp\n\t\n#+end_src")
  (previous-line))
(defun tk-org-insert-rust-block ()
  (interactive)
  (beginning-of-line)
  (insert "#+begin_src rust\n\t\n#+end_src")
  (previous-line))
(defun tk-org-insert-python-block ()
  (interactive)
  (beginning-of-line)
  (insert "#+begin_src python\n\t\n#+end_src")
  (previous-line))

;; Date
(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
  two prefix arguments, write out the day and month name."
  (interactive "P")
  (let ((format
          (cond
            ((not prefix) "%Y-%m-%d")
            ((equal prefix '(4)) "%A, %d %B %Y")))
         (system-time-locale "us_US"))
    (insert (format-time-string format))))

;; File Management
(defun reload ()
  "Shorcut to reload init file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun rename-fil3 (new-name)
  "The default rename file function keeps the file with the incorrect name, can be annoying."
  (interactive "FNew name: ")
  (let ((filename (buffer-file-name)))
    (if filename
      (progn
        (when (buffer-modified-p)
          (save-buffer))
        (rename-file filename new-name t)
        (kill-buffer (current-buffer))
        (find-file new-name)
        (message "Renamed '%s' -> '%s'" filename new-name))
      (message "Buffer '%s' isn't backed by a file!" (buffer-name)))))

(defun sudo-get-this-file ()
  "Makes use of TRAMP to get this file as sudo."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (find-alternate-file (concat "/sudo::" file-name))))

(defun path-append (path)
  "Add a path both to the $PATH variable and to Emacs' exec-path."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))

;; Comment-dwim
;; Similar behavior to other comment-dwim's, and less featureful
(defun tk-comment-dwim ()
  "Active region => (un)comment it. Else => (un)comment line."
  (interactive)
  (let (beg end)
    (if (region-active-p)
      (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
