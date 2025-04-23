# docker-yard

**🐳 [Docker](https://www.docker.com) container that serves [YARD](https://yardoc.org) documentation for [Ruby](https://www.ruby-lang.org/en/) applications.**

[![Releases](https://img.shields.io/github/v/release/CargoSense/docker-yard?logo=github&style=for-the-badge)](https://github.com/CargoSense/docker-yard/releases)
[![Build](https://img.shields.io/github/actions/workflow/status/CargoSense/docker-yard/publish.yml?logo=github&style=for-the-badge)](https://github.com/CargoSense/docker-yard/actions/workflows/publish.yml)

## Usage

You may be run this container directly using the [`docker run`](https://docs.docker.com/engine/containers/run/) command from the root of your project:

```sh
docker run --rm -it -p "8808:8808" -v "${PWD}:/app" ghcr.io/cargosense/yard:1.0.0
```

Alternatively, you may configure this container to run as part of a [Docker Compose](https://docs.docker.com/reference/compose-file/)-driven set of services:

```yaml
services:
  app:
    # Your application's configuration here.
  yard:
    image: "ghcr.io/cargosense/yard:1.0.0"
    ports:
      - "8808:8808"
    volumes:
      - ".:/app"
```

> [!TIP]
> By default, the container runs `yard server` but you may override this by passing a different command. See `yard --help` for available options.

## License

docker-yard is freely available under the [MIT License](https://opensource.org/licenses/MIT).
