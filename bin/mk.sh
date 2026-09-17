#!/bin/bash
# random_tree.sh — generates a randomized nested directory structure
# Usage: ./random_tree.sh [base_dir] [max_depth] [max_dirs_per_level]

BASE_DIR="${1:-./random_maze}"
MAX_DEPTH="${2:-4}"
MAX_DIRS="${3:-3}"

WORDS=(alpha bravo charlie delta echo foxtrot golf hotel india juliet
       kilo lima mike november oscar papa quebec romeo sierra tango
       uniform victor whiskey xray yankee zulu)

random_name() {
  echo "${WORDS[$RANDOM % ${#WORDS[@]}]}_$RANDOM"
}

build_level() {
  local current_path="$1"
  local depth_remaining="$2"

  if [ "$depth_remaining" -le 0 ]; then
    return
  fi

  local num_dirs=$(( (RANDOM % MAX_DIRS) + 1 ))

  for ((i = 0; i < num_dirs; i++)); do
    local dir_name
    dir_name=$(random_name)
    local new_path="$current_path/$dir_name"
    mkdir -p "$new_path"

    # Randomly drop a harmless decoy file in some directories
    if (( RANDOM % 3 == 0 )); then
      echo "nothing to see here" > "$new_path/notes.txt"
    fi

    # Recurse with reduced depth, random chance to stop early
    if (( RANDOM % 2 == 0 )); then
      build_level "$new_path" $((depth_remaining - 1))
    fi
  done
}

mkdir -p "$BASE_DIR"
build_level "$BASE_DIR" "$MAX_DEPTH"

echo "Tree created at: $BASE_DIR"
