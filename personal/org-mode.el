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

(setq-default org-agenda-files '("/home/elljoh/Documents/admin/org-agenda-files/"))

(require 'org-tempo)

(defvar org-agenda-files nil)

(defun my/create-daily-org-file ()
  "Create a new org file for the current day in the agenda directory if it
   doesn't exist."
  (let* ((agenda-dir (if (listp org-agenda-files)
                         (file-name-as-directory (car org-agenda-files))
                       (file-name-as-directory org-agenda-files)))
         (date-str (format-time-string "%Y-%m-%d"))
         (filename (expand-file-name (concat "notes-" date-str ".org") agenda-dir)))
    (unless (file-exists-p filename)
      (with-temp-file filename
        (insert "#+TITLE: Notes for " date-str "\n\n"))
      (message "Created new daily org file: %s" filename))

    (find-file filename)))

;; Run the function after Emacs has finished initializing
(add-hook 'after-init-hook #'my/create-daily-org-file)

(defun my/insert-org-date-with-time ()
  "Insert an active Org mode timestamp with the current date and time."
  (interactive)
  ;; The second argument 'with-hm' set to non-nil includes hours and minutes
  (org-insert-time-stamp (current-time) t))

;; Bind it to a key (C-c d)
;;(global-set-key (kbd "C-c d") #'my/insert-org-date-with-time)

(defvar my/daily-org-timer nil
  "Timer object for the daily org creation task.")

(defun my/schedule-daily-org ()
  "Schedule the daily org creation at midnight if not already scheduled."
  (interactive)
  ;; Cancel existing timer if it exists to avoid duplicates
  (when (timerp my/daily-org-timer)
    (cancel-timer my/daily-org-timer))
  ;; Set the new timer
  (setq my/daily-org-timer
        (run-at-time "00:00" 86400 #'my/create-daily-org-file)))

;; Call the scheduler
(my/schedule-daily-org)
