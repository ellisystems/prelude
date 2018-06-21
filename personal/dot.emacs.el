(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default css-indent-offset 2)
(setq-default c-basic-offest 2)
(setq-default js-indent-level 2)
(setq-default js2-basic-offset 2)

;; groovy indent hook
(add-hook 'groovy-mode-hook (
                             lambda ()
                                    (setq c-basic-offset 2)))

;; OSX yosemite maximize frame window
(global-set-key (kbd "C-x C-<f11>") 'toggle-frame-fullscreen)

;; Grep find shortcut
(global-set-key (kbd "C-> f") 'grep-find)

;; Duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (newline)
  (yank)
  )
(global-set-key (kbd "C-x C-d") 'duplicate-line)

;; buffer name to clipboard
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
(global-set-key (kbd "M-B") 'copy-file-name-to-clipboard)



;; Web Mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Disable Flycheck
(global-flycheck-mode -1)

;; Tags
(global-set-key (kbd "C-x t") 'etags-select-find-tag-at-point)
