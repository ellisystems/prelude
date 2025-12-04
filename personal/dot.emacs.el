(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default css-indent-offset 2)
(setq-default c-basic-offest 2)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default js2-basic-offset 2)

(add-to-list 'exec-path (concat "/usr/local/go/bin"))

;; groovy indent hook
(add-hook 'groovy-mode-hook (
                             lambda ()
                                    (setq c-basic-offset 2)))

;; OSX yosemite maximize frame window
(global-set-key (kbd "C-x C-<f11>") 'toggle-frame-fullscreen)

;; Grep find shortcut
(global-set-key (kbd "C-> f") 'grep-find)

;; Search forward regex
;;(global-set-key (kbd "C-x x") 're-search-forward)
;; Already defined C-M-s / C-M-r

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

;; JS mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; JSX/TSX mode
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))

;; Whitespace
(global-whitespace-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Go mode
;; (add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook
          (lambda ()
            (setq enable-local-variables 1)
            (defvar whitespace-style
              '(face empty trailing lines-tail)
              "Custom whitespace style for Golang")
            (setq whitespace-style
                  '(face empty trailing lines-tail))
            (setq tab-width 4)
            (setq indent-tabs-mode 1)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (whitespace-mode 1)
            (add-hook 'before-save-hook 'delete-trailing-whitespace)))

;; Flycheck
(global-flycheck-mode 1)

;; Tags
(global-set-key (kbd "C-x t") 'etags-select-find-tag-at-point)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Nvm
;;(require 'nvm)
;;(add-to-list 'auto-mode-alist '("\\.js?\\'" . nvm))

;;{{{ yasnippet & auto-insert

(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/personal/snippets/")
  (yas-global-mode 1))

(defun ibm/js-license ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "ibm_js_license" 'js-mode)))

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  (add-to-list 'auto-insert-alist  '(".*\\.js$" . [ibm/js-license])))

;;}}}

(use-package projectile :ensure t)

(global-company-mode 1)

;; Web Mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Disable Flycheck
;;(global-flycheck-mode -1)

;; Tags
(global-set-key (kbd "C-x t") 'etags-select-find-tag-at-point)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Nvm
;;(require 'nvm)
;;(add-to-list 'auto-mode-alist '("\\.js?\\'" . nvm))

;; For Java Language Server Protocol (LSP) mode
;; https://github.com/emacs-lsp/lsp-java
(require 'cc-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
;(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
;(use-package lsp-mode :ensure t)
;(use-package hydra :ensure t)
;(use-package company-lsp :ensure t)
;(use-package lsp-ui :ensure t)
;(use-package lsp-java :ensure t :after lsp
;             :config (add-hook 'java-mode-hook 'lsp))

;(use-package dap-mode
;             :ensure t :after lsp-mode
;             :config
;             (dap-mode t)
;             (dap-ui-mode t))

;(use-package dap-java :after (lsp-java))
;(use-package lsp-java-treemacs :after (treemacs))

;(require 'lsp-java)
;(add-hook 'java-mode-hook #'lsp)

;(setq lsp-java-workspace-dir "/home/elljoh/dev/projects/jdt-lsp-workspace/")
;(setq lsp-java-workspace-cache-dir "/home/elljoh/dev/projects/jdt-lsp-workspace/")

(add-hook 'prelude-prog-mode-hook
          (lambda () (smartparens-mode -1)) t)
