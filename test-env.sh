#!/bin/bash
# Used to setup a docker container to test zsh configurations

echo "Setting up a zsh testing environment with docker..."

TEST_IMAGE="zsh-env"
TEST_CONTAINER="zsh-test"

# Get the script's parent directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$SCRIPT_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

TEST_VOLUME="$SCRIPT_DIR:/root/.config/zsh:rw"

# Check if docker installed
if ! command -v docker &> /dev/null
then
    echo
    echo "Docker command not found, make sure it is installed."
    echo "Exiting..."
    echo
    exit 1
fi

echo
echo "Building $TEST_IMAGE docker container..."
echo

docker build --rm -f "$SCRIPT_DIR/Dockerfile" -t $TEST_IMAGE "."

# Check if container already exists
# Taken from https://stackoverflow.com/a/38576401
if [ ! "$(docker ps -q -f name=$TEST_CONTAINER)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$TEST_CONTAINER)" ]; then
        # Clean up the container if it exists but is exited
        docker rm $TEST_CONTAINER
    fi
fi

# Now enter the container in this shell interactively
echo
echo "Attaching to ZSH testing container..."
echo
docker run -it --name $TEST_CONTAINER -v $TEST_VOLUME --cpus="0.1" $TEST_IMAGE '/bin/zsh'

echo
echo "Cleaning up container..."
echo
docker rm $TEST_CONTAINER
echo
echo "Done! Hope it was productive. Exiting..."
exit 0
