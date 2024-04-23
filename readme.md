# Using Guix for development with gysela

The purpose of this small guide is to set-up a development environment for gyselalibxx,
by using Guix.

> GNU Guix is a package management tool for and distribution of the GNU system. Guix makes it easy for unprivileged users to install, upgrade, or remove software packages, to roll back to a previous package set, to build packages from source, and generally assists with the creation and maintenance of software environments.

[Guix Manual](https://guix.gnu.org/manual/en/guix.html#Managing-Software-the-Guix-Way)

# Part A: Development on machines without Guix

> This requires a machine that creates the repack that has Guix.

A regular Guix installation stores its files in `/gnu/store`. In machines where
this is not possible, we can pack our dependencies without much problem.

In this example I am deployung to Jean-Zay.

```
$ HOST=jean-zay.idris.fr
$ WORK=/gpfswork/rech/jpz/ueg37cx
```

## Creating pack

We use `guix pack` to create a tarball containing all the development dependencies.
The dependencies are specified in the `manifest.scm`, which contains the development
dependencies, and some other things.

```
$ guix time-machine -C ./channels.locked.scm -q -- \
       pack --format=tarball -R -S /bin=bin -S /etc=etc -m ./manifest.scm
....
/gnu/store/....tar.gz
```

## Copy pack and unpack

You can send the tarball to the host by any means, for example with scp.

It is important to unpack the tarball in a FS with **high limit of inodes**.

```
$ scp /gnu/store/....tar.gz $HOST:$WORK
$ ssh $HOST
(jean-zay) $ cd $WORK
(jean-zay) $ tar -xvf ...tar.gz
```

## Getting shell

To enter the shell where all the dependencies are available, run the following command:

```
(jean-zay) $ ./bin/bash --rcfile ./etc/profile
```

## Building

```
(jean-zay) $ cmake -B build -DGYSELALIBXX_DEPENDENCY_POLICIES=INSTALLED
....
```

----
----


# Appendix 1: Channels file

For this example, instead of using globally-defined channels, the channels are
provided in a declarative manifest `channels.locked.scm`.

This `channels.locked.scm` contains specific commits for guix, and is derived
from the `channels.scm` with the following command:


```
guix time-machine -C ./channels.scm -q -- \
     describe -f channels > channels.locked.scm
```
