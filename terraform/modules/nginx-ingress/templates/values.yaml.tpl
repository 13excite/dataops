controller:
    hostPort:
        enabled: true
    terminationGracePeriodSeconds: 0
    service:
        type: "NodePort"
    watchIngressWithoutClass: true
    nodeSelector:
        ingress-ready: "true"
    tolerations:
    - effect: "NoSchedule"
      key: "node-role.kubernetes.io/master"
      operator: "Equal"
    - effect: "NoSchedule"
      key: "node-role.kubernetes.io/control-plane"
      operator: "Equal"
    publishService:
        enabled: false
    extraArgs:
        publish-status-address: "localhost"
    config:
        worker-processes:        "${worker_count}"
        proxy-body-size:         "10m"  # default 1m
        client-body-buffer-size: "128k" # default 16k
        enable-real-ip:          true
    resources:
        requests:
            cpu:    "${resources_requests.cpu}"
            memory: "${resources_requests.memory}"
