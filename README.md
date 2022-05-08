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

```
hugo -D
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
podman build -t olaf-radicke-de:latest --no-cache=false .
```

Test run:

```
podman run --name olaf-radicke-de:latest -d -p 8080:80 --rm olaf-radicke-de
```

Push image:

```bash
podman login docker.io
podman tag  olaf-radicke-de:latest  olafradicke/olaf-radicke-de:1.0
podman push olafradicke/olaf-radicke-de:1.0
```