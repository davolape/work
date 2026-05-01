#!/bin/bash

METHODS=(GET POST PUT PATCH DELETE)

CODES=(200 201 400 401 403 404 500 501 502 503)

# 200 - uspeshniy zapros
# 201 - v rezultate uspeshnogo vipolneniya zaprosa bil sozdan noviy resurs
# 400 - nekorrektniy zapros(sintaksicheskaya oshibka)
# 401 - polzovatel' ne avtorizovan. nujno avtorizovat'sya
# 403 - dostup zapreshen
# 404 - ne naydeno
# 500 - vnutrennyaya oshibka servera
# 501 - net vozmojnosti dlya obrabotki zaprosa
# 502 - oshibochniy shlyuz
# 503 - server nedostupen

AGENTS=(
    "Mozilla/5.0"
    "Google Chrome/123.0.6312.86 Safari/537.36"
    "Opera/102.0.0.0"
    "Safari/605.1.15"
    "Internet Explorer/11.0"
    "Microsoft Edge/142.0.0.0"
    "Crawler and bot"
    "Library and net tool"
)

URLS=(
    "/"
    "/index.html"
    "/login"
    "/register"
    "/products"
    "/api/data"
    "/images/logo.png"
    "/admin"
)