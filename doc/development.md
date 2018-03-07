# Development

## Setup environment

```bash
bundle install
```

## Running checks

### rubocop

```base
bundle exec rake rubocop
```

### syntax lint

```base
bundle exec rake syntax lint
```

### metadata lint

```base
bundle exec rake metadata_lint
```

### spec

```base
bundle exec rake spec
```

## Updating documentation

```bash
bundle exec puppet strings generate --out ./doc/reference.md --format markdown '**/*.pp'
```
