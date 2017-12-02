## What is it?

Another PHP 7.2 (fpm) + nginx boilerplate docker image based on Alpine Linux 3.6.

## How to use it?

Via `docker run`:

```
docker run -p 80:80 bartoszmaciaszek/php-fpm-nginx:latest
```

With `docker-compose`:

just use the following snippet in your `docker-compose.yml` file:

```
  my_service:
    image: bartoszmaciaszek/php-fpm-nginx:latest
    ports:
      - 80:80
```

Visit http://localhost/ to see your `phpinfo()` page.

### How do I run my own app on top of this?

By default, the code (`index.php` with `phpinfo()`) is located in working directory: `/var/www/html`. Of course you can change the location and override web server vhost configuration to suit your needs.

First, mount your code, to, let's say `/app`. You can do it with `docker run` `-v` parameter or in your `docker-compose.yml` like this:

```
    volumes:
      - .:/app
```

It is a good idea to change the working directory as well `docker run -w` or via your `docker-compose.yml`:

```
    working_dir: /app
```

Then supply your vhost configuration as a volume
    
```
    volumes:
      ...
      - ./my-vhost.conf:/etc/nginx/sites-enabled/default.conf:ro
```
