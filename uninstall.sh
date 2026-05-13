#!/usr/bin/env bash
# 9router-sync uninstaller.
set -euo pipefail

APP_DIR=${APP_DIR:-"$HOME/.9router-sync"}

remove_link() {
  for dir in "$HOME/.local/bin" "$HOME/bin" /usr/local/bin; do
    link="$dir/9router-sync"
    if [ -L "$link" ] || [ -f "$link" ]; then
      rm -f "$link"
      printf 'removed %s\n' "$link"
    fi
  done
}

remove_link

if [ -d "$APP_DIR" ]; then
  rm -rf "$APP_DIR"
  printf 'removed %s\n' "$APP_DIR"
fi

cat <<EOF

The Supabase table and ~/.9router/sync.json were left untouched.
Delete them manually if you no longer need them:
  rm ~/.9router/sync.json
EOF
