;(defun duplicate-line()
;  (interactive)
;  (move-beginning-of-line 1)
;  (kill-line)
;  (yank)
;  (newline)
;  (yank)
;  )
;(global-set-key (kbd "C-x C-d") 'duplicate-line)

(defvar org-edit-src-content-indentation)
(defvar org-src-preserve-indentation)

(setq-default org-support-shift-select 'always)
(setq org-edit-src-content-indentation 0)
(setq org-src-preserve-indentation nil)

(require 'org-tempo)
