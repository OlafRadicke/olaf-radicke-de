Code of olaf-radicke.de
=======================

HUGO is used for the website.

Quick test
-----------

For the view in the Browser enter: 

```
hugo server
```

Build
-----

Live build:

```
hugo -D -v
```


Update the theme
----------------

The HUGO theme is added over submodule. So enter:

```bash
git submodule update --remote --rebase
```

Create container image
----------------------

Enter

```bash
podman build -t olaf-radicke-de:latest --no-cache=true .
```

Test run:

```
podman run --name olaf-radicke-de -d -p 8080:80 --rm olaf-radicke-de:latest
```

Build and push image (copy&paste)
---------------------------------

```bash
LATES_VERSION=2.10
hugo -D
podman build -t olaf-radicke-de:latest --no-cache=true .
podman tag  olaf-radicke-de:latest  olafradicke/olaf-radicke-de:${LATES_VERSION}
podman push olafradicke/olaf-radicke-de:${LATES_VERSION}
```

Todos
-----

