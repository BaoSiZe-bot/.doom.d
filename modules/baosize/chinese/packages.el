;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/modules/baosize/chinese/packages.el


(package! rime)
(package! ace-pinyin)
(package! pinyinlib)
(when (modulep! :editor evil) (package! evil-pinyin))
