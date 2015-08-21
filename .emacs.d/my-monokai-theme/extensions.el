;;; extensions.el --- my-monokai Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq my-monokai-theme-pre-extensions
      '(
        ;; pre extension my-monokais go here
        ))

(setq my-monokai-theme-post-extensions
      '(
        ;; post extension my-monokais go here
        ))

;; For each extension, define a function my-monokai/init-<extension-my-monokai>
;;
 (defun my-monokai-theme/init-my-extension ()
   (use-package my-monokai-theme)
   "Initialize my extension"
   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
