# Minimal preview target for agentbox `deploy-preview`.
# Serves a tiny static page that identifies THIS build (repo, branch, build
# time) so a preview URL can be confirmed to be serving this container and not
# a stale or unrelated one. Listens on 3000 (the `deploy-preview up --port`
# default), so no --port flag is needed.
FROM nginx:alpine

# Identify the build. BRANCH is passed at build time; both have safe defaults
# so `docker build .` with no args still produces an identifying page.
ARG REPO=agentbox-smoke
ARG BRANCH=unknown

# nginx listens on 80 by default; point it at 3000 instead.
RUN printf 'server {\n    listen 3000;\n    server_name _;\n    root /usr/share/nginx/html;\n    index index.html;\n}\n' > /etc/nginx/conf.d/default.conf

# Bake an identifying page, capturing the build time at build.
RUN BUILD_TIME="$(date -u +%Y-%m-%dT%H:%M:%SZ)" && \
    printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<title>%s preview</title>\n<style>body{font-family:system-ui,sans-serif;margin:3rem;line-height:1.6}code{background:#eee;padding:.1rem .3rem;border-radius:3px}</style>\n</head>\n<body>\n<h1>agentbox-smoke preview</h1>\n<p>This container is serving the <code>%s</code> repository preview.</p>\n<ul>\n<li><strong>Repository:</strong> %s</li>\n<li><strong>Branch:</strong> %s</li>\n<li><strong>Build time (UTC):</strong> %s</li>\n</ul>\n</body>\n</html>\n' \
      "$REPO" "$REPO" "$REPO" "$BRANCH" "$BUILD_TIME" \
      > /usr/share/nginx/html/index.html

EXPOSE 3000
