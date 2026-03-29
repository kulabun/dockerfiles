# GitHub Actions Runner

This is a custom Docker image for a self-hosted GitHub Actions runner.

## Usage

This runner is meant to be used for the `homelab` repository. You will need a runner token from the repository settings.

### Configuration

Before running, you must configure the runner. Start the container interactively or via an entrypoint script and run the configuration script provided by GitHub:

```bash
./config.sh --url https://github.com/kulabun/homelab --token <TOKEN_HERE>
```

*Note:* The token is set up on GitHub in the repository or organization settings under Actions -> Runners.

### Workflow Configuration

To use this self-hosted runner in your `homelab` GitHub Actions workflows, ensure your jobs include the following configuration:

```yaml
jobs:
  your-job-name:
    runs-on: self-hosted
    # ... other job steps
```
