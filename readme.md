## Creating pack

```
guix time-machine -C ./channels.locked.scm -q -- pack --format=tarball -R -S /bin=bin -m ./manifest.scm
```

## Lock channels

```
guix time-machine -C ./channels.scm -q -- describe -f channels > channels.locked.scm
```
