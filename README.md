# directory-editing-script-generator

directory-editing-script-generator is a script generator allowing 
automatic directory tree operations on identical directories.

## Explanation

For example, you have lots of directories of the following structure:

```
original
├── 1
│   └── a
├── 2
│   └── b
└── 3
    └── c

3 directories, 3 files
```

and you want to turn them into something other like:

```
changed
└── 1
    ├── 2
    │   ├── 3
    │   │   └── c
    │   └── b
    └── a

3 directories, 3 files
```

You could write transformation script manually, but this process is prone to errors.
Instead, it is simplier and more reliable to use directory-editing-script-generator,
which creates a script using 'original' and 'pattern' directory (discussed below).
This script, being called from an 'original' directory, will transform the latter
into a 'changed' directory. Such a script can only move, copy, rename and delete
files and directories. There are no contraints on resulting directory tree,
e.g. `dir` may be moved to `dir/dir` and vice versa.

A 'pattern' is a directory containing subdirectories and symlinks to paths under 
'original' directory only. Files and symlinks to other paths are considered
errors and ignored. A 'pattern' defines operations to be executed on the 
'original'-like directories. To convert `original` into `changed` directory
from the example, the following pattern may be used:

```
pattern
└── 1
    ├── 2
    │   ├── 3 -> ../../../original/3
    │   └── b -> ../../../original/2/b
    └── a -> ../../original/1/a

3 directories, 2 files
```

Thus a symbolic link is a declaration what to do to a target file/subdirectory 
from 'original' directory. Symbolic link's value -- original resource,
its location and name -- target placement. Multiple links to a single file
means copying; files/directories with no links pointing at them shall be deleted.

## Installation

1. Install [Roswell](https://github.com/roswell/roswell) to your system.

If you use Arch-based Linux distro, there is a package available in AUR: [roswell](https://aur.archlinux.org/packages/roswell/).

2. Install directory-editing-script-generator:

```sh
$ ros install ivanp7/directory-editing-script-generator
```

## Usage

Run program with

```sh
$ ros exec generate-directory-editing-script ORIGINAL-DIRECTORY-PATH PATTERN-DIRECTORY-PATH > script-name
```

If you add `$HOME/.roswell/bin` to your `$PATH`, 
you won't need to call Roswell explicitly:

```sh
$ generate-directory-editing-script ORIGINAL-DIRECTORY-PATH PATTERN-DIRECTORY-PATH > script-name
```

Resulting script should be called from the original-like directory only,
otherwise it will fail. Missing files or directories are considered as error.

## Author

Ivan Podmazov (ivanpzv8@gmail.com)

## [License](LICENSE)

