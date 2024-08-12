[
  {
    apiVersion: 'v1',
    kind: 'Secret',
    metadata: {
      name: 'testuser.acid-simple-cluster.credentials.postgresql.acid.zalan.do',
      namespace: std.extVar('namespace'),
      labels: {
        application: 'spilo',
        'cluster-name': 'acid-simple-cluster',
        team: 'acid',
      },
    },
    type: 'Opaque',
    data: {
      password: 'cGFzc3dkMTIzCg==',
      username: 'dGVzdHVzZXIK',
    },
  },
]
