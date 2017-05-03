;;; init-rust.el --- Initialize Rust support         -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oleksandr Manenko

;;; Commentary:

;; 

;;; Code:

(require 'init-elpa)
(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require 'init-elpa)
(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)
(require-package 'flycheck-rust)


(require 'company)
(require 'racer)
(require 'rust-mode)
(require 'electric)
(require 'eldoc)
(require 'flycheck)
(require 'flycheck-rust)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


(setq company-tooltip-align-annotations t)

(add-hook 'rust-mode-hook
          '(lambda ()
             (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
             (setq racer-rust-src-path (concat (getenv "HOME") "/.rust/src"))
             (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)
             (electric-pair-mode 1)))

(provide 'init-rust)
;;; init-rust.el ends here


