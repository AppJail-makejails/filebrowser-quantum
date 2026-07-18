# FileBrowser Quantum

FileBrowser Quantum provides an easy way to access and manage your files from the web. It has has a modern responsive interface that has many advanced features to manage users, access, sharing, and file preview and editing.

filebrowserquantum.com

<img src="https://filebrowserquantum.com/logo.svg" width="30%" height="auto" alt="FileBrowser Quantum logo">

## How to use this Makejail

```console
$ mkdir -p /var/appjail-volumes/filebrowser-quantum/db
$ mkdir -p /var/appjail-volumes/filebrowser-quantum/www
$ appjail oci run -Pd \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    -o fstab="/var/appjail-volumes/filebrowser-quantum/db /var/db/filebrowser-quantum" \
    -o fstab="/var/appjail-volumes/filebrowser-quantum/www /usr/local/www/filebrowser-quantum" \
    ghcr.io/appjail-makejails/filebrowser-quantum filebrowser-quantum
```

### Arguments (stage: build)

* `filebrowser-quantum_from` (default: `ghcr.io/appjail-makejails/filebrowser-quantum`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `filebrowser-quantum_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

### Volumes

| Name | Owner | Group | Perm | Type | Mountpoint |
| --- | --- | --- | --- | --- | --- |
| appjail-730d326caa-usr_local_www_filebrowser-quantum | `${PUID}` | `${PGID}` | - | - | /usr/local/www/filebrowser-quantum |
| appjail-a8024fc60d-var_db_filebrowser-quantum | `${PUID}` | `${PGID}` | - | - | /var/db/filebrowser-quantum |

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```

## Notes

1. `/usr/local/etc/filebrowser-quantum.yaml` is the configuration file used by this image, but keep in mind that the image will attempt to change the owner and group of this file if it has write permission.
