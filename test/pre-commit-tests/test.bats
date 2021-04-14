setup() {
    load '../test_helper/bats-support/load'
    load '../test_helper/bats-assert/load'
    load '../helpers/mocks/stub'
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    echo $DIR/../ > tacotuesday.log
    # make executables in src/ visible to PATH
    PATH="$DIR/../../hooks/pre-commit-scripts:$PATH"

    _GIT_ARGS="diff --cached HEAD"
    
    stub git "${_GIT_ARGS} : echo 'Not broken'" \
             "${_GIT_ARGS} : echo '<<<<HEAD'"
    
}

@test "Merge conflict script executes" {
    confirm-commit-merge-conflict
}

@test "Merge conflict script exits with 0 when passed Y to request for input" {
    enable -n read
    stub read "-n 1 -r < /dev/tty : echo 'Y\r'"
    confirm-commit-merge-conflict
    refute_output --partial "Merge conflict check passed"
    [ "$status" -eq 0 ]
}