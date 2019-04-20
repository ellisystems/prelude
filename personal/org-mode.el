;(defun duplicate-line()
;  (interactive)
;  (move-beginning-of-line 1)
;  (kill-line)
;  (yank)
;  (newline)
;  (yank)
;  )
;(global-set-key (kbd "C-x C-d") 'duplicate-line)

(setq org-support-shift-select 1)

