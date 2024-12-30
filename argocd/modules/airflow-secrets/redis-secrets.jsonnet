[
  {
    apiVersion: 'v1',
    data: {
      password: std.base64(std.extVar('redis-password')),
    },
    kind: 'Secret',
    metadata: {
      labels: {
        app: 'airflow-secrets',
      },
      name: 'airflow-redis-password',
      namespace: std.extVar('namespace'),
    },
    type: 'Opaque',
  },
  {
    apiVersion: 'v1',
    data: {
      connection: std.base64("redis://:" + std.extVar('redis-password') + "@airflow-redis:6379/0"),
    },
    kind: 'Secret',
    metadata: {
      labels: {
        app: 'airflow-secrets',
      },
      name: 'airflow-broker-url',
      namespace: std.extVar('namespace'),
    },
    type: 'Opaque',
  },
]