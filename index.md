---
layout: default
---

### Archetypes lets you use git to manage and share project templates

To create a new project using an archetypes template, 

```
bash <(curl http://archetypes.github.io/bootstrap.sh)
```

The important features for me when I wrote it:

* Make use of git, and allow for future changes to the template to be merge in to projects that were created from old versions of the template
* It should be easy to create template files that have content based off of project properties
* It should be easy to have files in the template whose name (and path) are based off of project properties.
* It should take as little effort as possible to instantiate a new project (*cough* AndroidIntelliJStarter *cough*)

More specifically, the checked-out template is transformed into your project by the following steps:
* All filenames are url-decoded and evaluated with the liquid template engine (you can reference any of the data in your properties.yaml in your filenames)
* Any files that end in ".liquid" are processed with the liquid template engine (you can reference any of the data in your properties.yaml)
* The script itself and its readme are deleted
