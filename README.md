# File Browser Quantum

FileBrowser Quantum is a massive fork of the file browser open-source project with the following changes:

1. Multiple sources support
2. Login support for OIDC, password, and proxy.
3. Revamped UI
4. Simplified configuration via `config.yaml` config file.
5. Ultra-efficient [indexing](https://github.com/gtsteffaniak/filebrowser/wiki/Indexing) and real-time updates
   - Real-time search results as you type.
   - Real-time monitoring and updates in the UI.
   - Search supports file and folder sizes, along with various filters.
6. Better listing browsing
   - More file type previews, such as **office** and **video** file previews
   - Instantly switches view modes and sort order without reloading data.
   - Folder sizes are displayed.
   - Navigating remembers the last scroll position.
7. Developer API support
   - Ability to create long-lived API Tokens.
   - A helpful Swagger page is available at `/swagger` endpoint for API enabled users.

github.com/gtsteffaniak/filebrowser

<img src="https://raw.githubusercontent.com/gtsteffaniak/filebrowser/refs/heads/main/frontend/public/img/logo.png" width="60%" height="auto" alt="filebrowser quantum logo">

## How to use this Makejail

### Basic usage

```sh
appjail makejail \
    -j filebrowser-quantum \
    -f gh+AppJail-makejails/filebrowser-quantum \
    -o virtualnet=":<random> default" \
    -o nat \
    -o expose=3080
```

### Arguments

* `filebrowser_quantum_tag` (default: `14.3`): see [#tags](#tags).
* `filebrowser_quantum_ajspec` (default: `gh+AppJail-makejails/filebrowser-quantum`): Entry point where the `appjail-ajspec(5)` file is located.
* `filebrowser_quantum_conf` (optional): Configuration file.

### Volumes

| Name                     | Owner | Group | Perm | Type | Mountpoint                         |
| ------------------------ | ----- | ----- | ---- | ---- | ---------------------------------- |
| filebrowser-quantum-data | 80    | 80    | 700  |  -   | /usr/local/www/filebrowser-quantum |
| filebrowser-quantum-db   | 80    | 80    | 700  |  -   | /var/db/filebrowser-quantum        |

## Tags

| Tag        | Arch     | Version            | Type   |
| ---------- | -------- | ------------------ | ------ |
| `14.3` | `amd64`  | `14.3-RELEASE` | `thin` |
| `15` | `amd64`  | `15` | `thin` |
