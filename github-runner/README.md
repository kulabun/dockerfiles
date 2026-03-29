# GitHub Actions Runner

This is a custom Docker image for a self-hosted GitHub Actions runner.

## Usage

This runner is meant to be used for the `homelab` repository. You will need a runner token from the repository settings.

### Configuration

The runner requires configuration variables passed as environment variables when you start the container:

```bash
docker run -e REPO_URL="https://github.com/kulabun/homelab" -e RUNNER_TOKEN="<TOKEN_HERE>" ghcr.io/kulabun/github-runner:latest
```

*Note:* The token is set up on GitHub in the repository or organization settings under Actions -> Runners. The container entrypoint handles registering the runner and automatically cleans it up on shutdown. It uses the `--ephemeral` flag to ensure a clean environment per job.

### Workflow Configuration

To use this self-hosted runner in your `homelab` GitHub Actions workflows, ensure your jobs include the following configuration:

```yaml
jobs:
  your-job-name:
    runs-on: self-hosted
    # ... other job steps
```
