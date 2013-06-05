#!/bin/bash

options=("archetypes/clojure" "archetypes/java")
select archetype in "${options[@]}"; do

  read -p "PROJECT NAME: " PROJECT
  git clone --origin archetype "https://github.com/$archetype.git" "$PROJECT"

  echo "Checked out into $PROJECT"
  echo "Next steps:"
  echo "  cd \"$PROJECT\""
  echo "  edit properties.yml"
  echo "  ./init.rb"
  echo "  git add -A"
  echo "  git commit -m \"Initialize project.\""
  echo "  git clean -df"
  break
done
