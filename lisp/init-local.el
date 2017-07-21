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

(provide  'init-local)
