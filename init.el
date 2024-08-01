;;disable splash screen and startup message
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


(setq lsp-eslint-auto-fix-on-save t)


