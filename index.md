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
* It should take as little effort as possible to instantiate a new project

More specifically, the checked-out template is transformed into your project by the following steps:

* All filenames are url-decoded and evaluated with the liquid template engine (you can reference any of the data in your properties.yaml in your filenames)
* Any files that end in ".liquid" are processed with the liquid template engine (you can reference any of the data in your properties.yaml)
* The script itself and its readme are deleted

### Making new archetypes

1. Make a minimal, working project for the platform you want to create an archetype for
1. Set up your `.gitignore` and initialize a git repository

    ```bash
    git init
    git add .
    git commit -m "Working example project"
    ```

1. Merge in the base archetype

    ```bash
    git remote add archetype https://github.com/archetypes/archetype.git
    git pull archetype master --allow-unrelated-histories
    # resolve merge conflicts
    git commit
    ```

1. Parameterize the template.  You may want to do one or more of the following
    * Add a `.liquid` extension to any file and then use
    * Add additional parameters in `properties.yaml`
    * Use liquid template syntax in any folder name or file name.  The name will be URL-decoded before being evaluated by liquid.  (For [example](https://github.com/archetypes/java), `{% raw %}{{ package %7C as_path }}{% endraw %}`)
    * Add additional liquid filters to `init.rb`
    * Add additional shell commands to the end of `init.rb`
1. `git commit` your parameterized template
1. Test the template

    ```bash
    # Make sure everything is committed
    ./init.rb
    # Make sure everything works
    git reset --hard HEAD^
    ```

1. Fill in "&lt;this repository&gt;" in `README.md`
1. Push your archetype to github
1. If you feel your archetype is stable and of general interest, submit a pull-request to [archetypes.github.io/archetypes.txt](https://github.com/archetypes/archetypes.github.io/blob/master/archetypes.txt) to have your archetype included in the suggested list
