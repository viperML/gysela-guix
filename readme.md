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
PS1="(guix) $PS1" bash --rcfile ./etc/profile
```

## Lock channels

```
guix time-machine -C ./channels.scm -q -- \
     describe -f channels > channels.locked.scm
```
