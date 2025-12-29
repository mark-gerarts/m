# VSCode settings

## Settings

Settings and keybindings are stored in `settings.json` and `keybindings.json`
respectively. On a fresh install just copy these.

```bash
$ mkdir -p ~/.config/Code/User
$ cp .config/Code/User/* ~/.config/Code/User/
```

## Extension

Extensions are a bit trickier. They can be exported using `--list-extensions`:

```
$ code --list-extensions > ~/.config/Code/User/extensions.list
```

They can then be imported using:

```
cat extensions.list | xargs -n 1 code --install-extension
```
