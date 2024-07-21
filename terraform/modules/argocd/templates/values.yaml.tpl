global:
  domain: argocd.dataops
  tolerations:
    - effect: "NoSchedule"
      key: "node-role.kubernetes.io/master"
      operator: "Equal"
    - effect: "NoSchedule"
      key: "node-role.kubernetes.io/control-plane"
      operator: "Equal"

configs:
  secret:
    # -- Bcrypt hashed admin password
    # `htpasswd -nbBC 10 "" $ARGO_PWD | tr -d ':\n' | sed 's/$2y/$2a/'`
    argocdServerAdminPassword: "${argocd_server_admin_password_hash}"
    # any time before now
    argocdServerAdminPasswordMtime: "2024-07-12T11:11:11Z"

  repositories:
    dataops:
      url: https://github.com/13excite/dataops

  credentialTemplates:
    ssh-creds:
     url: git@github.com:13excite
     sshPrivateKey: |
        ${indent(8, dataops_repo_ssh_key)}

dex:
  enabled: false

repoServer:
  extraArgs:
  - --loglevel=warn

server:
  extraArgs:
  - --insecure
  ingress:
    enabled: true
    ingressClassName: "nginx"
    tls: false
    hostname: "argocd.dataops"
