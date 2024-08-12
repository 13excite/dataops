[
  {
    apiVersion: 'v1',
    data: {
      password: 'cGFzc3dvcmQxMjMK',
      username: 'YWlyZmxvd191c2Vy',
    },
    kind: "Secret",
    metadata: {
      labels: {
        application: 'spilo',
        'cluster-name': 'data-airflow-cls',
        team: "data",
      },
      name: "airflow-user.data-airflow-cls.credentials.postgresql.acid.zalan.do",
      namespace: std.extVar('namespace'),
    },
    type: "Opaque",
  },
]
