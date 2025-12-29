# kli

`kli` is a cloud and DevOps automation CLI tool.

## Homebrew Installation

```bash
brew install krakenteknologies/kraken-releases/kli
```

## Configuration

The default configuration file is located at `~/.kli/config.yaml`.
You can initialize a new configuration file using:
```bash
kli config init
```

## Commands

### Global Flags
- `--config string`: config file path (default: `~/.kli/config.yaml`)
- `--log-level string`: log level (`trace`|`debug`|`info`|`warn`|`error`)

### Version
- `kli version`: Print version info

### Config
- `kli config init`: Initialize a default config file in your home directory.
  - `--path string`: Output path for config file.
  - `--force`: Overwrite config file if it already exists.

### Argo CD
Operations for managing Argo CD.

#### Contexts
Manage Argo CD contexts (servers).
- `kli argocd context show`: Show all Argo CD contexts.
- `kli argocd context set [context]`: Set the default Argo CD context.
  - `--select`: Interactively select the default context.

#### Status
- `kli argocd status`: Check Argo CD API status (reachability + version).
  - `--context string`: ArgoCD context name.
  - `--select`: Interactively select a context.
  - `--all`: Run status against all configured Argo CD contexts.
  - `--apps`: Also list applications grouped by health and sync status.
  - Overrides: `--server`, `--token`, `--insecure`, `--plain-http`, `--timeout`.

#### App
- `kli argocd app refresh`: Hard refresh an Argo CD application (forces Argo CD to re-fetch app state).
  - `--app string`: Application name to refresh.
  - `--all`: Hard refresh ALL applications in the selected context.
  - `--context string`: ArgoCD context name.
  - `--select`: Interactively select a context.
  - Overrides: `--server`, `--token`, `--insecure`, `--plain-http`, `--timeout`.

### Kubernetes
Operations for inspecting Kubernetes resources.

#### Status
- `kli k8s status`: List status of key resources (Nodes, Pods, Deployments, PVCs, etc.).
  - `--context string`: Kubeconfig context (or kli alias).

#### Stats
- `kli k8s stats`: Show pod resource usage vs requests/limits.
  - `-n, --namespace string`: Target namespace (required).
  - `--context string`: Kubeconfig context (or kli alias).

#### Events
- `kli k8s events`: List events for Pods and Nodes.
  - `-n, --namespace string`: Target namespace.
  - `-A, --all-namespaces`: List events from all namespaces.
  - `--context string`: Kubeconfig context (or kli alias).

#### Check
- `kli k8s check`: Perform health checks on Nodes, Pods, and Events.
  - `-n, --namespace string`: Scope checks to a specific namespace (skips cluster-wide checks like Nodes).
  - `--context string`: Kubeconfig context (or kli alias).