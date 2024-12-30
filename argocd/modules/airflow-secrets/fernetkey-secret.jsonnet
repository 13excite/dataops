[
  {
    apiVersion: 'v1',
    data: {
      'fernet-key': 'TlBkQkxEN0Vaei1ibWxpYjNHcXAxV2hnQ2toVUgzSlctNVZxN05lSzZrZz0K',
    },
    kind: 'Secret',
    metadata: {
      labels: {
        app: 'airflow-secrets',
      },
      name: 'airflow-fernet-key',
      namespace: std.extVar('namespace'),
    },
    type: 'Opaque',
  },
]