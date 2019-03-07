#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

readonly BRANCH_NAME="${TRAVIS_BRANCH:-$CI_COMMIT_REF_NAME}"
readonly _TAG_NAME="${CI_COMMIT_TAG:-}"
readonly TAG_NAME="${TRAVIS_TAG:-$_TAG_NAME}"
readonly TAG_VERSION="${TAG_NAME#v}"
readonly CI_BUILD_ID="${TRAVIS_BUILD_NUMBER:-$CI_JOB_ID}"
readonly BUILD_ID="${TAG_VERSION:-"${BRANCH_NAME}-${CI_BUILD_ID}"}"
readonly BITS_64_OR_NONE=$1

if [ "${BITS_64_OR_NONE}" == "" ]; then
	readonly SUFFIX_64_OR_NONE=""
else
	readonly SUFFIX_64_OR_NONE="-${BITS_64_OR_NONE}b"
fi

# wherever you'll be ssh-ing into user@machine
readonly TARGET_MACHINE="openponk@ccmi.fit.cvut.cz"
# target dir on the target machine
readonly UPLOAD_DIR="~/uploads/fsm"

# customize the name of the Pharo image you will be deploying
readonly PROJECT_NAME="openponk"
readonly ARTIFACT_ZIP="${PROJECT_NAME}-image${BITS_64_OR_NONE}-${BUILD_ID}.zip"

# zip the image, and upload it to the server
deploy-scp() {
	local directory=$1
	local zip=$2
	echo "Running zip"
	zip -qr "$zip" "$directory"
	echo "Running scp"
	scp -rp "$zip" "$TARGET_MACHINE:$UPLOAD_DIR"
	# I have a server-side post-processing script that bundles VMs into the build
	echo "Calling target machine script"
	ssh "$TARGET_MACHINE" "~/scripts/process-fsm-build.sh ${BUILD_ID} ${BITS_64_OR_NONE}"
}

main() {
	local directory="${PROJECT_NAME}-${BUILD_ID}${SUFFIX_64_OR_NONE}"
	mv $ARTIFACT_DIR $directory
	echo "Deploying build ${BUILD_ID}${SUFFIX_64_OR_NONE}."
	deploy-scp $directory $ARTIFACT_ZIP
	echo "Build ${BUILD_ID}${SUFFIX_64_OR_NONE} deployed."
}

if [ "$BRANCH_NAME" = "master" ] || [ -n "$TAG_NAME" ]; then
	main
fi
