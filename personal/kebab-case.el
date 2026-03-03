;;;; Convert word list to string kebab-case
(defun change-case-kebab-case-render (word-list)
  (string-join (mapcar 'downcase word-list) "-"))

;(global-set-key (kbd "C-x C-t C-k") 'change-case-kebab-case-render)

;(current-active-maps)
