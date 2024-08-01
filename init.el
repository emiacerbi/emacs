(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(typescript-mode lsp-mode solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "outline" :slant normal :weight regular :height 158 :width normal)))))

(require 'package) 
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) 
(package-initialize)
(unless (package-installed-p 'use-package) 
  (package-refresh-contents)
  (package-install 'use-package)) 
(eval-and-compile 
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(load-theme 'solarized-dark t)
(push '(fullscreen . maximized) default-frame-alist)

(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (web-mode . lsp-deferred))
  :config
  (setq lsp-eslint-auto-fix-on-save t))

;; Web Mode for JSX/TSX files
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.ts\\'" . web-mode)
         ("\\.tsx\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-quoting nil))  ;; Disable automatic insertion of quotes

;; Ensure the use of eslint with flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode))

;; Typescript-mode
(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

;; Adding json-mode for JSON files
(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

;; Adding yaml-mode for YAML files
(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")
