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

## Contributing

Please use [Git Flow](https://github.com/petervanderdoes/gitflow-avh) when
contributing to this project.

1. Fork the reference repository
2. Create a feature branch
   ```bash
   git flow feature start foo
   ```
3. Implement your change
   * Do not forget to also update tests and documentation
4. Run all checks locally
5. Commit
6. Publish your feature branch
   ```bash
   git flow feature publish
   ```
7. Create a pull request toward the ``develop`` branch
