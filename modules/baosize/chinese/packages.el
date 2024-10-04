;; -*- no-byte-compile: t; -*-
;;; baosize/chinese/packages.el


(package! rime)
(package! ace-pinyin)
(package! pinyinlib)
(when (modulep! :editor evil) (package! evil-pinyin))
