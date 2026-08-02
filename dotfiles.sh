#!/usr/bin/env bash
#
# Copy dotfiles into $HOME, backing up any file that already exists.
# Backups land in ~/backups/dotfiles, mirroring the layout of $HOME, with a
# timestamp appended to the file name.

set -euo pipefail

SCRIPT_NAME="$(basename "$0")"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source directory: sibling "dotfiles" dir next to the repo root, overridable.
DOTFILES_DIR="${DOTFILES_DIR:-$(cd "${SCRIPT_DIR}/.." && pwd)/dotfiles}"
BACKUP_DIR="${BACKUP_DIR:-${HOME}/backups/dotfiles}"

# Single stamp for the whole run so one invocation is easy to identify.
STAMP="$(date +%Y%m%d-%H%M%S)"

log() { printf '%s\n' "$*"; }
die() { printf '%s: %s\n' "${SCRIPT_NAME}" "$*" >&2; exit 1; }

echo "${SCRIPT_NAME} starting."

[[ -d "${DOTFILES_DIR}" ]] || die "source directory not found: ${DOTFILES_DIR}"

copied=0
backed_up=0

# Walk every regular file under the source tree so nested paths such as
# .config/starship.toml are handled individually. This leaves unrelated files
# in ~/.config untouched.
while IFS= read -r -d '' src; do
    rel="${src#"${DOTFILES_DIR}"/}"
    dest="${HOME}/${rel}"

    if [[ -e "${dest}" || -L "${dest}" ]]; then
        backup="${BACKUP_DIR}/${rel}.${STAMP}"
        mkdir -p "$(dirname "${backup}")"
        cp -Lp "${dest}" "${backup}"
        log "backed up ${dest} -> ${backup}"
        backed_up=$((backed_up + 1))
    fi

    mkdir -p "$(dirname "${dest}")"q
    cp -p "${src}" "${dest}"
    log "installed ${rel}"
    copied=$((copied + 1))
done < <(find "${DOTFILES_DIR}" -type f -print0)

log "${copied} file(s) installed, ${backed_up} backed up to ${BACKUP_DIR}"

echo "${SCRIPT_NAME} complete."
