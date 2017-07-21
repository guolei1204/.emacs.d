
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))
;; run
(defun gorun ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))
;; compile 
(defun gocompile ()
  "compile current buffer"
  (interactive)
  (compile (concat "go build " (buffer-file-name))))



(defun go-mode-setup()
  (go-eldoc-setup)
  (add-hook 'brefore-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "C-c C-c") 'gorun)
  (lcoal-set-key (kbd "C-c C-l") 'gocompile)
  )
(add-hook 'go-mode-hook 'go-mode-setup)

(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
