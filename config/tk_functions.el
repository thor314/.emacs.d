(defun offer-to-create-dir-on-save ()
	"On saving a file to a non-existant dir, query user to create dir."
	(add-hook
	 'before-save-hook (lambda ()
											 (when buffer-file-name
												 (let ((dir (file-name-directory buffer-file-name)))
													 (when (and (not (file-exists-p dir))
																			(y-or-n-p (format "Dir %s does not exist. Create? " dir)))
														 (make-directory dir t)))))))
(offer-to-create-dir-on-save)

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
(global-set-key (kbd "C-!") 'window-split-toggle)

(defun describe-thing ()
"Describe fn or var in other window."
	(interactive)
	(let ((thing (symbol-at-point)))
		(cond
		 ((fboundp thing) (describe-function thing))
		 ((boundp thing) (describe-var thing)))))
(global-set-key (kbd "C-h C-h") 'describe-thing)

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

(defun insert-date (prefix)
	"Insert the current date. With prefix-argument, use ISO format. With
two prefix arguments, write out the day and month name."
	(interactive "P")
	(let ((format (cond
								 ((not prefix) "%Y-%m-%d")
								 ((equal prefix '(4)) "%d-%m-%Y")
								 ((equal prefix '(16)) "%A, %d. %B %Y")))
				(system-time-locale "us_US"))
		(insert (format-time-string format))))

(defun reload ()
	"Shorcut to reload init file."
	(interactive)
	(load-file "~/.emacs.d/init.el"))

(defun load-config ()
	"Open config.org."
	(interactive)
	(find-file "~/.emacs.d/config"))

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

(defun tk-comment-dwim ()
	"Active region => (un)comment it. Else => (un)comment line."
	(interactive)
	(let (beg end)
		(if (region-active-p)
				(setq beg (region-beginning) end (region-end))
			(setq beg (line-beginning-position) end (line-end-position)))
		(comment-or-uncomment-region beg end)))
(global-set-key (kbd "M-;") 'tk-comment-dwim)
