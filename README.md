# vigilant-guacamole
Repository for the vigilant-guacamole project

## Development Instructions
### System requirements
- Ruby 2.5.3
- Node v10.13.0
- NPM v6.4.1

### Enviromental variables
*none*

### Getting started
[Quick Start](https://github.com/wildland/guides#setting-up-your-development-enviroment) for getting development machine setup.

1. Install all the [system requirements](/#system-requirements).
1. [Clone](https://help.github.com/articles/fetching-a-remote/#clone) this repository.
1. Install foreman (gem install foreman).
1. Install mailcatcher (gem install mailcatcher).
1. Run `bundle install`
1. Run `rake wildland`
1. Run `foreman start -f Procfile.dev`

### Getting work done
[Wildland guide](https://github.com/wildland/) for getting work done.

### Seed Data Location
`db/seeds.rb` site admin login info
`lib/tasks/demo.rake` all seed users info

## Production Requirements
### Enviroment varables
- `SECRET_KEY_BASE`
- `SKIP_EMBER=true`
