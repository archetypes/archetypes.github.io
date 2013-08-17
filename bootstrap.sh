#!/bin/bash

ARCHETYPE="$1"
if [ -z "$ARCHETYPE" ]; then
  select ARCHETYPE in `curl -s http://archetypes.github.io/archetypes.txt`; do
    break
  done
fi

echo ""
echo "## Creating a new $ARCHETYPE project"
read -p "PROJECT NAME: " PROJECT
git clone --origin archetype "https://github.com/$ARCHETYPE.git" "$PROJECT" || exit $?
cd "$PROJECT" || exit $?
./init.rb
echo "You probably want to \`cd \"$PROJECT\"\`"
