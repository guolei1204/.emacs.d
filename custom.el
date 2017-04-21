(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4cf3221feff53e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(package-selected-packages
   (quote
    (project-explorer go-complete go-autocomplete go-eldoc go-mode inf-clojure xref-js2 git-blamed yari yaml-mode yagist whole-line-or-region whitespace-cleanup-mode wgrep-ag vc-darcs unfill undo-tree tidy textile-mode tagedit switch-window sql-indent smex smarty-mode slime-company skewer-less session scss-mode scratch sass-mode ruby-hash-syntax rspec-mode robe rinari regex-tool redshank rainbow-mode rainbow-delimiters projectile-rails project-local-variables pip-requirements php-mode paredit-everywhere page-break-lines osx-location origami org-pomodoro org-mac-iCal org-fstree org-cliplink nlinum mwe-log-commands multiple-cursors move-dup mmm-mode markdown-mode magit-gh-pulls lua-mode lively less-css-mode ledger-mode json-mode js-comint ipretty intero indent-guide immortal-scratch ibuffer-vc htmlize hl-sexp hippie-expand-slime hindent highlight-symbol highlight-quoted highlight-escape-sequences hayoo guide-key grab-mac-link goto-gem gnuplot gitignore-mode github-issues github-clone gitconfig-mode git-timemachine git-messenger git-blame fullframe flycheck-package flycheck-ledger flycheck-elm flycheck-clojure fill-column-indicator expand-region exec-path-from-shell erlang ensime elm-mode elisp-slime-nav elein dsvn disable-mouse dired-sort dired+ diminish diff-hl default-text-scale dash-at-point darcsum csv-nav csv-mode css-eldoc crontab-mode counsel company-quickhelp company-anaconda color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cljsbuild-mode cl-lib-highlight cask-mode bundler bug-reference-github browse-kill-ring browse-at-remote avy auto-compile anzu aggressive-indent ag)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(defun gorun ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

(defun go-mode-setup()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'brefore-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "C-c C-c") 'gorun)
  )
(add-hook 'go-mode-hook 'go-mode-setup)

(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)


(require 'project-explorer)
(global-set-key (kbd "M-e") 'project-explorer-toggle)

(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)

(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(require 'go-flycheck)
