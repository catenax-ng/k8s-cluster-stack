# Catena-X cluster stack umbrella Chart

This [Helm](https://helm.sh/) chart combines a set of tools, that is used on Catena-X consortium kubernetes
environments. It forms a solid basis for operating and monitoring applications on the cluster and can also be used on
non consortium environments.

The stack focuses on operating and monitoring. It does not contain tooling for a specific deployment strategy, like
GitOps controllers or similar.

## The stack

The stack installed by this Chart consists of the following tools:

- [ingress-nginx](https://github.com/kubernetes/ingress-nginx) as ingress controller

## Configuration

The following sections contain specific configuration topics for each tool of the stack.

### ingress-nginx

The alias used for the ingress-nginx dependency is `ingress-nginx`. Check out the configuration options for
ingress-nginx in
the [official docs](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/#configuration).

__Cloud provider specific annotations:__

There have been issues, where Azure AKS could not get health information from ingress-nginx and therefore did not route
any traffic to the cluster. This was solved by specifying the health check path manually. Azure specific.

```yaml
# values.yaml
...
ingress-nginx:
  controller:
    service:
      annotations:
        service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path: "/healthz"
```

### cert-manager

The alias used for cert-manager is `certmanager`. Check out available config option on the
[official ArtifactHUB documentation](https://artifacthub.io/packages/helm/cert-manager/cert-manager#configuration).

__Set credentials to allow DNS zone configuration:__

TLS certificates are generated via [LetsEncrypt](https://letsencrypt.org/). To answer LetsEncrypt challenges,
cert-manager has to temporarily add routes to the DNS zone

```yaml
# values.yaml
...
tls:
  dnsClientSecret: <your-dns-client-secret>
```

__DNS resolvers:__

Azure DNS example:
```yaml
# values.yaml
tls: 
  solvers: 
    - dns01:
        azureDNS:
        clientID: <azure-dns-zone-client-id>
        clientSecretSecretRef: <
        hostedZoneName: {{ .Values.issuer.azure.hostedZoneName }}
        resourceGroupName: {{ .Values.issuer.azure.resourceGroupName }}
        subscriptionID: {{ .Values.issuer.azure.subscriptionID }}
        tenantID: {{ .Values.issuer.azure.tenantID }}
```
