## Creating pack

```
guix time-machine -C ./channels.locked.scm -q -- \ 
     pack --format=tarball -R -S /bin=bin -S /etc=etc -m ./manifest.scm
```

## Copy pack and unpack

scp ....

```
cd $WORK
tar -xvf ...tar.gz
```

## Getting shell
```
PS1="(guix) $PS1" ./bin/bash --rcfile ./etc/profile
```

## Building

```
cmake -B build -DGYSELALIBXX_DEPENDENCY_POLICIES=INSTALLED
```

## Lock channels

```
guix time-machine -C ./channels.scm -q -- \
     describe -f channels > channels.locked.scm
```
