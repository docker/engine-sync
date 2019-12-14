#!/usr/bin/env bash

set -e -u -o pipefail

export ORIGIN="${1}"
export FORK="${2}"

dir=$(mktemp -d)

(
	cd "${dir}"
	git init --bare .

	git remote add origin "${ORIGIN}"
	git remote add fork "${FORK}"

	BRANCHES=($(git ls-remote --heads origin | awk '{ print $2 }' | awk -F'/' '{ print $3 }'))

	BRANCHES_LOCAL=()
	for b in ${BRANCHES[@]}; do
		BRANCHES_LOCAL+=("${b}:${b}")
	done

	git fetch --update-head-ok origin ${BRANCHES_LOCAL[@]}
	git push fork ${BRANCHES[@]}

	git fetch --tags origin
	git push --tags fork
)

rm -rf "${dir}"
