;;;; directory-editing-script-generator.asd

(asdf:defsystem #:directory-editing-script-generator
  :description "Directory editing script generator"
  :author "Ivan Podmazov <ivanpzv8@gmail.com>"
  :license  "MIT"
  :depends-on (#:alexandria)
  :components ((:static-file "README.md")
               (:static-file "LICENSE")
               (:static-file "roswell/generate-directory-editing-script.ros")))

