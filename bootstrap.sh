#!/bin/bash

ARCHETYPE="$1"
if [ -z "$ARCHETYPE" ]; then
  options=("archetypes/clojure" "archetypes/java")
  select ARCHETYPE in "${options[@]}"; do
    break
  done
fi

echo ""
echo "## Creating a new $ARCHETYPE project"
read -p "PROJECT NAME: " PROJECT
git clone --origin archetype "https://github.com/$ARCHETYPE.git" "$PROJECT" || exit $?

echo "Checked out into $PROJECT"
echo "Next steps:"
echo "  cd \"$PROJECT\""
echo "  edit properties.yml"
echo "  ./init.rb"
echo "  git add -A"
echo "  git commit -m \"Initialize project.\""
echo "  git clean -df"
