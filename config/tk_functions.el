(defun describe-in-popup  (fn)
"Create a popup with the help text created by describe-function or describe-variable"
(let* ((description (save-window-excursion
(funcall fn (symbol-at-point))
(switch-to-buffer "*Help*")
(buffer-string))))
(popup-tip description
:point (point)
:around t
:height 30
:scroll-bar t
:margin t)))

(defun describe-thing-in-popup ()
"Call either describe-function or describe-variable on symbol-at-point."
(interactive)
(let* ((thing (symbol-at-point)))
(cond
((fboundp thing) (describe-in-popup 'describe-function))
((boundp thing) (describe-in-popup 'describe-variable)))))
(global-set-key (kbd "C-h C-h") 'describe-thing-in-popup)

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
(global-set-key (kbd "C-c d") 'insert-date)

(defun tk-comment-dwim ()
"Active region => (un)comment it. Else => (un)comment line."
(interactive)
(let (beg end)
(if (region-active-p)
(setq beg (region-beginning) end (region-end))
(setq beg (line-beginning-position) end (line-end-position)))
(comment-or-uncomment-region beg end)))

(global-set-key (kbd "M-;") 'tk-comment-dwim)
