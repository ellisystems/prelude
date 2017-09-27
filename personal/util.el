(defun set-exec-path-nvm (ver)
  "Set the node version used by sub processes by specifying the nvm version e.g. 8.4.0"
  (interactive "Mnvm use: ")
  (let ((new-path (mapcar (lambda (x) (replace-regexp-in-string "node/v[0-9]+\.?[0-9]+\.?[0-9]+" (concat "node/v" ver) x)) exec-path)
))
    (print new-path)
    (setq exec-path new-path)))

(defun tfn (arg)
  "test function"
  (interactive "MtheArg:")
  (let ((foo (concat arg "bar")))
    (print foo)))
